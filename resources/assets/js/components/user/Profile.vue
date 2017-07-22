<style>

</style>
<template>
    <div>
        <div class="panel panel-default">
            <div class="panel-heading">{{ title }}</div>

            <div class="panel-body">
                <table class="table table-borderless m-b-none">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Role</th>
                        <th>Email</th>
                        <th>Created</th>
                    </tr>
                    </thead>

                    <tbody>
                    <tr>
                        <!-- ID -->
                        <td style="vertical-align: middle;">
                            {{ user.id }}
                        </td>

                        <!-- Name -->
                        <td style="vertical-align: middle;" @click="showName('show user name', $event)">
                            {{ user.name | capitalize }}
                        </td>

                        <!-- Role -->
                        <td style="vertical-align: middle;">
                            {{ user.role }}
                        </td>

                        <!-- Email -->
                        <td style="vertical-align: middle;">
                            {{ user.email }}
                        </td>

                        <!-- Created at -->
                        <td style="vertical-align: middle;">
                            {{ user.created_at }}
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        props: ['title', 'user_id'],
        data() {
            return {
                user: [],
            };
        },
        filters: {
            capitalize: function (value) {
                if (!value) return ''
                value = value.toString()
                return value.charAt(0).toUpperCase() + value.slice(1)
            }
        },
        methods: {
            prepareComponent() {
                this.getProfile();
            },
            getProfile() {
                axios.get('/api/users/'+this.user_id)
                    .then(response => {
                        this.user = response.data;
                    });
            },
            showName(msg, event) {
                if(event.type == 'click'){
                    console.log(msg+': '+this.user.name);
                }
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
