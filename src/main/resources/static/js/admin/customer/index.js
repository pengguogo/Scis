layui.define([ 'layer',  'table','common'], function (exports) {
    var $ = layui.jquery,
        layer = layui.layer,
        common = layui.common,
        table  = layui.table ;
    table.render({
        elem: '#customer'
        ,height: 'full-200'
        ,method:'GET'
        ,toolbar: true
        ,title: '客户信息表'
        ,totalRow: true
        ,url: '/admin/customer/list' //数据接口
        ,page: true //开启分页
        ,cols: [[ //表头
            {field: 'khm', align:'center', title: '客户名',unresize:true}
            ,{field: 'gj', align:'center', title: '国家',unresize:true}
            ,{field: 'lxfs', align:'center', title: '联系方式',unresize:true}
            ,{field: 'yx', align:'center', title: '邮箱',unresize:true}
            ,{field: 'khdz', align:'center', title: '客户地址',unresize:true}
            ,{field: 'gxqcp', align:'center', title: '感兴趣的产品',unresize:true}
            ,{field: 'khfl', align:'center', title: '客户分类',unresize:true}
            ,{fixed: 'right',  title:'操作',align:'center', toolbar: '#operator',unresize:true}
        ]]
    });

    //监听工具条
    table.on('tool(table)', function(obj){
        var data = obj.data;
        if(obj.event === 'del'){
            del(data.id);
        } else if(obj.event === 'edit'){
            common.frame_show('编辑','/admin/customer/form?id='+data.id);
        }
    });

    //添加数据
    $('#addcustomer').click(function () {
        var index = layer.load(1);
        setTimeout(function () {
            layer.close(index);
            common.frame_show('产品添加','/admin/customer/form');
            // layer.msg('打开添加窗口');
        }, 500);
    });

    //导出数据
    $('#outcustomer').click(function () {
        window.location.href = "/admin/customer/ExcelDownloads";
    });

    //导入数据
    $('#importcustomer').click(function () {
        var index = layer.load(1);
        setTimeout(function () {
            layer.close(index);
            common.frame_show('产品导入','/admin/customer/importFile');
            // layer.msg('打开添加窗口');
        }, 500);
    });

    //批量删除数据
    $('#deleteAll').click(function () {
        var index = layer.load(1);

    });

    //输出接口，主要是两个函数，一个删除一个编辑
    var datalist = {
        deleteData: function (id) {
            layer.confirm('确定删除？', {
                btn: ['确定', '取消'] //按钮
            }, function () {
                del(id);
            }, function () {

            });
        },
        editData: function (id) {
            common.frame_show('分类编辑','/admin/customer/form?id='+id);
        }
    };
    function del(id) {
        layer.confirm('真的删除行么', function (index) {
            $.ajax({
                type: "DELETE",
                dataType: "json",
                url: "/admin/customer/" + id + "/del",
                success: function (ret) {
                    if (ret.isOk) {
                        layer.msg("操作成功", {time: 2000}, function () {
                            layer.close(index);
                            window.location.href = "/admin/customer/index";
                        });
                    } else {
                        layer.msg(ret.msg, {time: 2000});
                    }
                }
            });
        });
    }
    var keyword='';
    //搜索
    $('#search').click(function () {
        keyword = $("#keyword").val();
        table.reload('customer', {
            url: "/admin/customer/search"
            ,where: {keyword:keyword} //设定异步数据接口的额外参数
            //,height: 300
        });
    });
    //精确搜索
    $('#search2').click(function () {
        keyword = $("#keyword").val();
        table.reload('customer', {
            url: "/admin/customer/search2"
            ,where: {keyword:keyword} //设定异步数据接口的额外参数
            //,height: 300
        });
    });
    exports('admin/customer/index', datalist);
});