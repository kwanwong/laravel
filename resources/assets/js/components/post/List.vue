<style scoped>
</style>

<template>
    <div>
        <div v-if="message" class="alert alert-success" role="alert">{{ message }}</div>

        <div class="panel panel-default">
            <div class="panel-heading">
                <div style="display: flex; justify-content: space-between; align-items: center;">
                    <span>{{ title }}</span>
                </div>
            </div>

            <div class="panel-body">
                <ul class="media-list">
                    <li v-for="(post, i) in posts" class="media">
                        <div class="media-left">
                            <img class="img-rounded" :src="post.thumb" :alt="post.title"/>
                        </div>
                        <div class="media-body">
                            <h4 class="media-heading">
                                <a v-bind:href="post.id | formatUrl" :title="post.title">{{ post.title }}</a>
                            </h4>
                            <button class="small btn btn-primary pull-right _btn_delete_post" @click="remove(i, post.id)" :data-id="post.id">删除</button>
                            <span class="glyphicon glyphicon-time small">{{ post.created_at }}</span>&nbsp;|&nbsp;
                            <span class="glyphicon glyphicon-star small">{{ post.views }}</span>
                        </div>
                    </li>
                </ul>
            </div>

        </div>
    </div>
</template>

<script>
    export default{
        props: ['title', 'user_id'],
        filters: {
            formatUrl: function(value) {
                if(!value) return ''
                return '/posts/' + value
            }
        },
        data() {
            return {
                posts: [],
                message: '',
            }
        },
        methods: {
            prepareComponent() {
                this._posts();
            },
            _posts() {
                axios.get('/api/users/' + this.user_id + '/posts')
                    .then(response => {
                        this.posts = response.data;
                    });
            },
            remove(i, value) {
                // 更改数组长度以便Vue监控到数组变化
                this.posts.splice(i, 1);
                let _this = this
                axios.delete('/api/posts/' + value)
                    .then(function(res) {
                        if(res.data.code == 200){
                            _this.prepareComponent();
                            _this.message = res.data.message;
                            // 3秒后隐藏
                            setTimeout(function() {
                                _this.message = '';
                            }, 3000);
                        }
                    });
            }
        },
        ready() {
            this.prepareComponent();
        },
        mounted() {
            this.prepareComponent();
        }
    }
</script>