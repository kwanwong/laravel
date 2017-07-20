<style>

</style>
<template>
    <div>
        <div class="panel panel-default">
            <div class="panel-heading">{{ title }}</div>

            <div class="panel-body">
                <p class="m-b-none" v-if="user.length === 0">
                    You have not created any OAuth clients.
                </p>

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
                        <td style="vertical-align: middle;">
                            {{ user.name }}
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
        methods: {
            prepareComponent() {
                this.getProfile();
            },
            getProfile() {
                axios.get('/api/users/'+this.user_id)
                    .then(response => {
                        this.user = response.data;
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
