$('input[name="all"]').click(function(){
    //alert(this.checked);
    if($(this).is(':checked')){
        $('input[name="itemCheckbox"]').each(function(){
            //此处如果用attr，会出现第三次失效的情况
            $(this).prop("checked",true);
        });
    }else{
        $('input[name="itemCheckbox"]').each(function(){
            $(this).prop("checked",false);
        });
        //$(this).removeAttr("checked");
    }

});