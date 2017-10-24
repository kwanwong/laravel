<?php
/**
 * Created by PhpStorm.
 * User: Kwan Wong
 * Date: 2017/10/21
 * Time: 14:40
 */

namespace Repository\Contracts;

interface RepositoryInterface
{
    /**
     * 获取全部记录
     *
     * @param array $columns 要获取的列
     * @return mixed
     */
    public function all($columns = ['*']);

    /**
     * 分页获取记录
     *
     * @param int $perPage 每页条数
     * @param array $columns 要获取的列
     * @return mixed
     */
    public function paginate($perPage = 15, $columns = ['*']);

    /**
     * 添加记录
     *
     * @param array $data
     * @return mixed
     */
    public function create(array $data);

    /**
     * 更新记录
     *
     * @param array $data
     * @param $id
     * @param $field
     * @return mixed
     */
    public function update(array $data, $id, $field);

    /**
     * 删除记录
     *
     * @param $id
     * @return mixed
     */
    public function delete($id);

    /**
     * 按主键获取记录
     *
     * @param $id 主键ID
     * @param array $columns 要获取的列
     * @return mixed
     */
    public function find($id, $columns = array('*'));

    /**
     * 按指定列值获取记录
     *
     * @param $field
     * @param $value
     * @param array $columns
     * @return mixed
     */
    public function findBy($field, $value, $columns = array('*'));
}