(function($) {
    $(window).on('load',function () {
        $('#status').fadeOut();
        $('#preloader').delay(300).fadeOut('slow');
    });

    $("#navs-slider a").bind("click", function () {
        signup_in(this);
    })
    $(".signup").bind("click", function () {
        signup();
    })
    $(".signin").bind("click", function () {
        signin();
    })
    function signup_in(sid) {
        if ($(sid).attr("id") === "signin") {
            signin();
        } else {
            signup();
        }
    }

    function signin() {
        $("#navs-slider a").attr("class", "");
        $("#navs-slider a:first-child").addClass("active");
        $(".navs-slider-bar").animate({left: "80px"}, 50);
        $("#sign-form-1").css("display", "block");
        $("#sign-form-2").css("display", "none");
        $("#sign-form-1 input").val("");
        $('#sign-form-2 .captcha').css({"border-top": "0", "height": "0"});
        $("form span").css("transform", "translateX(200px)");
    }

    function signup() {
        $("#navs-slider a").attr("class", "");
        $("#navs-slider a:nth-child(2)").attr("class", "active");
        $(".navs-slider-bar").animate({left: "150px"}, 50);
        $("#sign-form-1").css("display", "none");
        $("#sign-form-2").css("display", "block");
        $("#sign-form-2 input").val("");
        $('#sign-form-1 .captcha').css({"border-top": "0", "height": "0"});
        $("form span").css("transform", "translateX(200px)");
        $("#repassword").focus(function () {
            $("#sign-form-2 .captcha").animate({height: "49px"}, 300);
            $('#sign-form-2 .captcha').css("border-top", "1px solid #d5d5d5");
            $("form span").css("transform", "translateX(0px)");
        });
    }

    /*购买页面*/
    var ul = $(".product-img ul");
    var count = 0;
    var liN = $(".product-img li").length;
    var li = $(".product-img li")
    var viewImg = $(".product-img .view img")[0];
    var liImg = $(".product-img li");
    $(".product-img li").hover(function () {
        $(".product-img li").attr("class", "");
        $(this).addClass("n-hover");
        viewImg.src = liImg.eq(count).find("img")[0].src;
        count = $(this).index();
    })
    $(".product-img a.up").bind("click", function () {
        count--;
        if (count < 0) {
            count = liN - 1;
        }
        if (count > 5) {
            ul.css("top", -(count - 5) * 68);
        }
        console.info(liN);
        console.info(count);
        if (count == 0) {
            ul.css("top", "0");
        }
        li.attr("class", "");
        li.eq(count).addClass("n-hover");
        viewImg.src = liImg.eq(count).find("img")[0].src;
        /*$(".product-img ul").css("top",count*68);
         if(j*68>0){
         $(".product-img ul").css("top");
         }*/
    })
    $(".product-img a.down").bind("click", function () {
        count++;
        if (count > liN - 1) {
            count = 0;
        }
        if (count > 5) {
            ul.css("top", -(count - 5) * 68);
        }
        console.info(liN);
        console.info(count);
        if (count == 0) {
            ul.css("top", "0");
        }
        li.attr("class", "");
        li.eq(count).addClass("n-hover");
        viewImg.src = liImg.eq(count).find("img")[0].src;
        /*var ulH =$(".product-img ul").css("height");
         $(".product-img ul").css("top",count*68);*/
    })

    var t = $(".details .text-box");

    $('.details .min').attr('disabled',true);

    $(".details .add").click(function(){
        t.val(parseInt(t.val())+1)
        if (parseInt(t.val())!=1){
            $('.details .min').attr('disabled',false);
        }
    })

    $(".details .min").click(function(){
        t.val(parseInt(t.val())-1);
        if (parseInt(t.val())==1){
            $('.details .min').attr('disabled',true);
        }
    })

    $(".sum-btn").bind("click",function(){
        alert("已提交订单！确定将返回首页！");
    });
    //产品选择
    $('.Checkbox label').on('click', function () {
        var t = $(this);
        var is = t.hasClass('checked');
        if (is) {
            t.removeClass('checked');
        } else {
            $('.carts-foot .sum').css("background", "#ff9900");
            $('.carts-foot .sum').css("cursor", "pointer");
            t.addClass('checked');
        }
        isall();//是否全选
    });

    //全选
    $('#all-select+label,#all-select-1+label').on('click', function () {
        var t = $("#all-select+label,#all-select-1+label");
        var is = t.hasClass('checked');
        var li = $('.carts-content .Checkbox label');
        if (is) {
            t.removeClass('checked');
            li.removeClass('checked');
            $('.carts-foot .sum').css("background", "#686868");
            $('.carts-foot .sum').css("cursor", "not-allowed");
        } else {
            t.addClass('checked');
            li.addClass('checked');
            $('.carts-foot .sum').css("background", "#ff9900");
            $('.carts-foot .sum').css("cursor", "pointer");
        }
    })

    //判断是否全选
    function isall() {
        var all = $('#all-select+label,#all-select-1+label')
        var allnum = $('.carts-content .Checkbox label').length;
        var checknum = $('.carts-content .Checkbox label.checked').length;
        if (checknum == allnum) {
            all.addClass('checked')
        } else {
            all.removeClass('checked')
        }
        if (checknum <= 0) {
            $('.carts-foot .sum').css("background", "#686868");
            $('.carts-foot .sum').css("cursor", "not-allowed");
        }
    }

    /*注销*/
    var logoutL = $(".user").css("width");
    $(".user,.logout").bind("mouseover", function () {
        $("span .user+.logout").css("left", logoutL);
        $(".user+.logout").css("display", "block");
        $(".user").css("border", "#8195e4 2px solid");
    })
    $(".user,.logout").bind("mouseout", function () {
        $("span .user+.logout").css("left", "0");
        $(".user+.logout").css("display", "none");
        $(".user").css("border", "transparent 2px solid");
    })

    $("dl dt").bind("click", function () {
        $(this).find("i").attr("class") == "i" ? $(this).find("i").attr("class", "") : $("dt i").attr("class", "") && $(this).find("i").attr("class", "i");
        $("dl dd").removeClass("n");
    })
    $("dl dd").bind("click", function () {
        $("dl dd").removeClass("n");
        $(this).addClass("n");
    })

    var i = 0;
    $(".wrap-right").bind("click", function () {
        i++;
        if (i > 5) {
            i = 0;
        }
        $(".slide ul:first-child").animate({left: i * 235 - 1175}, 200);
        $(".slide ul:last-child").animate({left: i * 235}, 200);
    })
    $(".wrap-left").bind("click", function () {
        i--;
        if (i < 0) {
            i = 5;
        }
        $(".slide ul:first-child").animate({left: i * 235 - 1175}, 200);
        $(".slide ul:last-child").animate({left: i * 235}, 200);
    })

    /*提示*/
    $(function () {
        $("[data-toggle='tooltip']").tooltip();
    });
    $("form input").keyup(function () {
        $("form span").css("transform", "translateX(200px)");
    })
    if ($("form span").val() != null) {
        $("form span").css("transform", "translateX(0px)");
    }
    /*邮箱补全*/
    $("#email_adress").keyup(function () {
        email_complete(this);
    })
    $("#signup-email_adress").keyup(function () {
        email_complete(this);
    })
    /*验证码*/
    $("#password-1").focus(function () {
        $('#sign-form-1 .captcha').animate({height: "49px"}, 300);
        $('#sign-form-1 .captcha').css("border-top", "1px solid #d5d5d5");
    });

})(jQuery);
