function HeadBack() {
    window.history.back();
}

function UserCenter() {
    window.location = "/phone/usercenter";
}

function ShowAlert(txt) {
    $(".alert").show().find(".txt").text(txt);
}

function HideAlert() {
    $(".alert").hide();
}

//返回顶部
$('.gotop').on('click', function (e) {
    e.preventDefault();
    window.scrollTo(0, 0);
})

//分享按钮
$('.share .btn').on('click', function (e) {
    e.preventDefault();
    var $share = $('<div class="sharetip"><div class="mask"></div><div class="ico"></div></div>')
            .on('click', function (e) {
                $(this).remove();
                $('html').css('overflow', 'auto');
            });

    $('body').append($share);
    $('html').css('overflow', 'hidden');
})