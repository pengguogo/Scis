layui.define([ 'layer',  'table','common'], function (exports) {
    var $ = layui.jquery,
        layer = layui.layer,
        common = layui.common,
        table  = layui.table ;
    table.render({
        elem: '#product'
        ,height: 'full-200'
        ,method:'GET'
        ,toolbar: true
        ,title: '产品信息表'
        ,totalRow: true
        ,url: '/admin/product/list' //数据接口
        ,page: true //开启分页
        ,cols: [[ //表头
            {field: 'productName', align:'center', title: '产品名称',unresize:true}
            ,{field: 'sku', align:'center', title: 'sku',unresize:true}
            ,{field: 'oe', align:'center', title: 'OE',unresize:true}
            ,{field: 'zl', align:'center', title: '重量',unresize:true}
            ,{field: 'cc', title: '尺寸',unresize:true}
            ,{field: 'cpp', title: '车品牌',unresize:true}
            ,{field: 'spxh', title: '适配型号',unresize:true}
            ,{fixed: 'right',  title:'操作',align:'center', toolbar: '#operator',unresize:true}
        ]]
    });

    //监听工具条
    table.on('tool(table)', function(obj){
        var data = obj.data;
        if(obj.event === 'del'){
            del(data.id);
        } else if(obj.event === 'edit'){
            common.frame_show('编辑','/admin/product/form?id='+data.id);
        }
    });

    //添加数据
    $('#addproduct').click(function () {
        var index = layer.load(1);
        setTimeout(function () {
            layer.close(index);
            common.frame_show('产品添加','/admin/product/form');
            // layer.msg('打开添加窗口');
        }, 500);
    });

    //导出数据
    $('#outproduct').click(function () {
        window.location.href = "/admin/product/ExcelDownloads";
    });

    //导入数据
    $('#importproduct').click(function () {
        var index = layer.load(1);
        setTimeout(function () {
            layer.close(index);
            common.frame_show('产品导入','/admin/product/importFile');
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
            common.frame_show('分类编辑','/admin/product/form?id='+id);
        }
    };
    function del(id) {
        layer.confirm('真的删除行么', function (index) {
            $.ajax({
                type: "DELETE",
                dataType: "json",
                url: "/admin/product/" + id + "/del",
                success: function (ret) {
                    if (ret.isOk) {
                        layer.msg("操作成功", {time: 2000}, function () {
                            layer.close(index);
                            window.location.href = "/admin/product/index";
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
        table.reload('product', {
            url: "/admin/product/search"
            ,where: {keyword:keyword} //设定异步数据接口的额外参数
            //,height: 300
        });
    });
    //精确搜索
    $('#search2').click(function () {
        keyword = $("#keyword").val();
        table.reload('product', {
            url: "/admin/product/search2"
            ,where: {keyword:keyword} //设定异步数据接口的额外参数
            //,height: 300
        });
    });
    exports('admin/product/index', datalist);
});