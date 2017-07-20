<style>
    span.red { color: red }
</style>
<template>
    <div>
        <div class="panel panel-default">
            <div class="panel-heading">Example Component</div>

            <div class="panel-body">
                <span class="red">I'm an example component!</span>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        mounted() {
            console.log('Component mounted.')
        }
    }
</script>
