<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html; charset=utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>晒“萌笑”宝贝，拿苹果Watch！</title>
<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"><meta content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport"><meta name="Keywords"><meta name="Description">
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"><meta content="no-cache,must-revalidate" http-equiv="Cache-Control"><meta content="no-cache" http-equiv="pragma"><meta content="0" http-equiv="expires"><meta content="telephone=no, address=no" name="format-detection"><meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <style type="text/css">
        *
        {
            margin: 0;
            padding: 0;
            list-style-type: none;
            font-style: normal;
        }
        body
        {
            background: #4b8d7f;
        }
        a, img
        {
            border: 0;
        }
        .content
        {
			background-color: #4db0b6;
        }
        .image
        {
            width: 100%;
            height: auto;
            z-index: 1;
        }
        
        .item
        {
            height: auto;
            margin-top: 10px;
            background: #237a67;
            color: #fff;
        }
        .item .txt
        {
            height: auto;
            line-height: 20px;
            position:relative;
        }
        .item .txt .no
        {
            display:block;
            padding-right:30px;
            padding-left: 5px;
            font-family: Arial;
        }
        .item .txt .votes
        {
            position:absolute;
            right:5px;
            top:0px;
            height:20px;
            font-family: Arial;
        }
        .item .action
        {
            display: block;
            height: 32px;
            line-height: 32px;
            text-align: center;
            background: #060;
            color: #fff;
        }
        .laud
        {
            position: absolute;
            width: 40px;
            height: 40px;
            right: 6px;
            bottom: 6px;
            background: url(/assets/btn-vote.png) no-repeat center center;
        }
        
        .pager
        {
            clear: both;
            float: left;
            width: 100%;
            text-align: center;
        }
        .pager .itm
        {
            display: inline-block;
            height: 36px;
            line-height: 36px;
            padding: 10px 20px 0px 20px;
            text-decoration: none;
            color: #fff;
        }
        .pager .itm .o
        {
            display: block;
            padding-left: 30px;
            height: 36px;
            background: #ce6a72;
            border: 1px solid #fff;
            border-radius: 0px 5px 0px 5px;
            margin-left: 8px;
            background: url(/assets/mc/mc-1.png) no-repeat 2px center;
            background-size: 28px 28px;
            font-size: 20px;
            color: #fff;
        }
        
        .pager .itm .cur
        {
            background-color: #c63;
            color: #fff;
        }
        
        .pic-form
        {
            width: 48%;
            height: auto;
            float: left;
            margin-left: 1%;
            padding-bottom: 20px;
        }
        .right-form
        {
            float: right;
            margin-right: 1%;
        }
        
        .control
        {
            position: fixed;
            width: 100%;
            height: auto;
            left: 0px;
            bottom: 0px;
        }
        .control .action
        {
            position: absolute;
            width: 33%;
            height: 100%;
            left: 0px;
            bottom: 0px;
        }
        
        .count
        {
            position: relative;
            width: 100%;
            height: 60px;    
			background: url(<%=request.getContextPath()%>/prefer/tp1/style/p1_05.jpg) no-repeat scroll center center;
			filter:"progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod='scale')";  
			-moz-background-size:100% 100%;
			background-size:100% 100%; 
			margin-top:3%;
        }
        .count .action
        {
            position: absolute;
            padding-top: 10px;
            left: 0px;
            top: 0px;
            text-align: center;
            color: #fff;
        }
        
        .search
        {
            position: fixed;
            width: 100%;
            height: 150px;
            left: 0px;
            top: 0px;
            background: rgba(0,0,0,0.7);
            color: #fff;
            display: none;
        }
        .search div
        {
            padding: 10px 10px 0px 10px;
        }
        .search input
        {
            width: 100%;
            height: 40px;
            line-height: 40px;
            text-align: center;
            margin-bottom: 10px;
        }
        
        .rank
        {
            position: fixed;
            width: 90%;
            height: 80%;
            left: 5%;
            top: 5%;
            background: #fff;
            display: none;
        }
        .rank-body
        {
            height: 100%;
            overflow: scroll;
        }
        
        .rank-list
        {
            border: 1px solid #aaa;
            border-collapse: collapse;
            text-align: center;
        }
        .rank-list th
        {
            background: #333;
            color: #fff;
        }
        .rank .close
        {
            position: absolute;
            width: 30px;
            height: 30px;
            right: -15px;
            top: -15px;
            background: #237a67;
            border: 1px solid #fff;
            color: #fff;
            text-align: center;
            line-height: 30px;
            border-radius: 50% 50%;
            font-size: 20px;
        }
        .screen
        {
            position: fixed;
            top: 0px;
            margin-top: 0px;
            bottom: 0px;
            z-index: 1;
        }
        
        .join
        {
            display: block;
            height: auto;
            background: #29003a;
            color: #fff;
            text-align: center;
            padding: 10px 10px 10px 10px;
            border-radius: 8px 8px 8px 8px;
            margin: 0px 10px 0px 10px;
        }
        .join-tip
        {
            text-align: left;
        }
        
        .item-summary
        {
            margin: 0px 10px 10px 10px;
            position: relative;
            padding-top: 10px;
        }
        
        .item-desc:before
        {
            position: absolute;
            top: -10px;
            left: 30px;
            width: 0;
            height: 0;
            display: block;
            content: " ";
            border-color: transparent;
            border-style: solid solid outset;
            border-width: 10px 10px 10px 10px;
            pointer-events: none;
            border-bottom-color: rgba(0,0,0,0.2);
        }
        
        
        
        .item-summary .frame
        {
            background: rgba(0,0,0,0.2);
            border-radius: 8px 8px 8px 8px;
            line-height: 22px;
            padding: 10px;
        }
        
        .item-summary p
        {
            color: #fff;
        }
        
        .control1
        {
            margin: 0px 10px 0px 10px;
            height: 12vw;
            padding-top: 6px;
        }
        
        .control1 .action
        {
            display: block;
            width: 25%;
            background: #f4c00a;
            color: #fff;
            text-align: center;
            border-radius: 8px 8px 8px 8px;
            float: left;
			padding: 2%;
			font-size:3vw;
        }
        .control1 .right
        {
            float: right;
            background: #65aed9;
        }
        
        .other
        {
            position: fixed;
            width: 100%;
            height: 100%;
            left: 0px;
            top: 0px;
            background: rgba(0,0,0,0.6);
            z-index: 1000000;
            display: none;
        }
        .other .tip
        {
            position: absolute;
            width: 80%;
            height: auto;
            padding: 4%;
            left: 6%;
            top: 100px;
            background: #237a67;
            border-radius: 8px 8px 8px 8px;
            font-size: 18px;
            color: #fff;
        }
        .other .close
        {
            display: block;
            margin: 16px 10px 0px 10px;
            background: #00aa67;
            color: #fff;
            height: 32px;
            line-height: 32px;
            text-align: center;
            border-radius: 5px 5px 5px 5px;
        }
    </style>
    <style type="text/css">
        .dialog
        {
            position: fixed;
            z-index: 99999;
            width: 100%;
            height: 100%;
            left: 0px;
            top: 0px;
            display: none;
        }
        .dialog i
        {
            position: absolute;
            left: 50%;
            top: 50%;
            font-style: normal;
        }
        .loading i.mask
        {
            width: 80px;
            height: 80px;
            margin-left: -40px;
            margin-top: -40px;
            background: url(/assets/loading1.gif) no-repeat center center #000;
            opacity: 0.6;
        }
        .alert i
        {
            width: 200px;
            height: 75px;
            margin-left: -100px;
            margin-top: -50px;
        }
        .alert .form
        {
            background: rgba(0, 0, 0, 0.5);
        }
        .alert .form .txt
        {
            position: absolute;
            width: 190px;
            height: 30px;
            left: 5px;
            top: 5px;
            text-align: center;
            line-height: 30px;
            color: #fff;
        }
        .alert i.form a
        {
            position: absolute;
            width: 60px;
            height: 24px;
            left: 70px;
            bottom: 8px;
            line-height: 24px;
            text-align: center;
            color: #111;
            background: #ddd;
            border-radius: 2px 2px 2px 2px;
        }
    </style>
    <script type="text/javascript">
        var who = "", obj = 1, usign="";
    </script>
<style class="firebugResetStyles" type="text/css" charset="utf-8">/* See license.txt for terms of usage */
/** reset styling **/
.firebugResetStyles {
    z-index: 2147483646 !important;
    top: 0 !important;
    left: 0 !important;
    display: block !important;
    border: 0 none !important;
    margin: 0 !important;
    padding: 0 !important;
    outline: 0 !important;
    min-width: 0 !important;
    max-width: none !important;
    min-height: 0 !important;
    max-height: none !important;
    position: fixed !important;
    transform: rotate(0deg) !important;
    transform-origin: 50% 50% !important;
    border-radius: 0 !important;
    box-shadow: none !important;
    background: transparent none !important;
    pointer-events: none !important;
    white-space: normal !important;
}
style.firebugResetStyles {
    display: none !important;
}

.firebugBlockBackgroundColor {
    background-color: transparent !important;
}

.firebugResetStyles:before, .firebugResetStyles:after {
    content: "" !important;
}
/**actual styling to be modified by firebug theme**/
.firebugCanvas {
    display: none !important;
}

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
.firebugLayoutBox {
    width: auto !important;
    position: static !important;
}

.firebugLayoutBoxOffset {
    opacity: 0.8 !important;
    position: fixed !important;
}

.firebugLayoutLine {
    opacity: 0.4 !important;
    background-color: #000000 !important;
}

.firebugLayoutLineLeft, .firebugLayoutLineRight {
    width: 1px !important;
    height: 100% !important;
}

.firebugLayoutLineTop, .firebugLayoutLineBottom {
    width: 100% !important;
    height: 1px !important;
}

.firebugLayoutLineTop {
    margin-top: -1px !important;
    border-top: 1px solid #999999 !important;
}

.firebugLayoutLineRight {
    border-right: 1px solid #999999 !important;
}

.firebugLayoutLineBottom {
    border-bottom: 1px solid #999999 !important;
}

.firebugLayoutLineLeft {
    margin-left: -1px !important;
    border-left: 1px solid #999999 !important;
}

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
.firebugLayoutBoxParent {
    border-top: 0 none !important;
    border-right: 1px dashed #E00 !important;
    border-bottom: 1px dashed #E00 !important;
    border-left: 0 none !important;
    position: fixed !important;
    width: auto !important;
}

.firebugRuler{
    position: absolute !important;
}

.firebugRulerH {
    top: -15px !important;
    left: 0 !important;
    width: 100% !important;
    height: 14px !important;
    background: url("data:image/png,%89PNG%0D%0A%1A%0A%00%00%00%0DIHDR%00%00%13%88%00%00%00%0E%08%02%00%00%00L%25a%0A%00%00%00%04gAMA%00%00%D6%D8%D4OX2%00%00%00%19tEXtSoftware%00Adobe%20ImageReadyq%C9e%3C%00%00%04%F8IDATx%DA%EC%DD%D1n%E2%3A%00E%D1%80%F8%FF%EF%E2%AF2%95%D0D4%0E%C1%14%B0%8Fa-%E9%3E%CC%9C%87n%B9%81%A6W0%1C%A6i%9A%E7y%0As8%1CT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AATE9%FE%FCw%3E%9F%AF%2B%2F%BA%97%FDT%1D~K(%5C%9D%D5%EA%1B%5C%86%B5%A9%BDU%B5y%80%ED%AB*%03%FAV9%AB%E1%CEj%E7%82%EF%FB%18%BC%AEJ8%AB%FA'%D2%BEU9%D7U%ECc0%E1%A2r%5DynwVi%CFW%7F%BB%17%7Dy%EACU%CD%0E%F0%FA%3BX%FEbV%FEM%9B%2B%AD%BE%AA%E5%95v%AB%AA%E3E5%DCu%15rV9%07%B5%7F%B5w%FCm%BA%BE%AA%FBY%3D%14%F0%EE%C7%60%0EU%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5JU%88%D3%F5%1F%AE%DF%3B%1B%F2%3E%DAUCNa%F92%D02%AC%7Dm%F9%3A%D4%F2%8B6%AE*%BF%5C%C2Ym~9g5%D0Y%95%17%7C%C8c%B0%7C%18%26%9CU%CD%13i%F7%AA%90%B3Z%7D%95%B4%C7%60%E6E%B5%BC%05%B4%FBY%95U%9E%DB%FD%1C%FC%E0%9F%83%7F%BE%17%7DkjMU%E3%03%AC%7CWj%DF%83%9An%BCG%AE%F1%95%96yQ%0Dq%5Dy%00%3Et%B5'%FC6%5DS%95pV%95%01%81%FF'%07%00%00%00%00%00%00%00%00%00%F8x%C7%F0%BE%9COp%5D%C9%7C%AD%E7%E6%EBV%FB%1E%E0(%07%E5%AC%C6%3A%ABi%9C%8F%C6%0E9%AB%C0'%D2%8E%9F%F99%D0E%B5%99%14%F5%0D%CD%7F%24%C6%DEH%B8%E9rV%DFs%DB%D0%F7%00k%FE%1D%84%84%83J%B8%E3%BA%FB%EF%20%84%1C%D7%AD%B0%8E%D7U%C8Y%05%1E%D4t%EF%AD%95Q%BF8w%BF%E9%0A%BF%EB%03%00%00%00%00%00%00%00%00%00%B8vJ%8E%BB%F5%B1u%8Cx%80%E1o%5E%CA9%AB%CB%CB%8E%03%DF%1D%B7T%25%9C%D5(%EFJM8%AB%CC'%D2%B2*%A4s%E7c6%FB%3E%FA%A2%1E%80~%0E%3E%DA%10x%5D%95Uig%15u%15%ED%7C%14%B6%87%A1%3B%FCo8%A8%D8o%D3%ADO%01%EDx%83%1A~%1B%9FpP%A3%DC%C6'%9C%95gK%00%00%00%00%00%00%00%00%00%20%D9%C9%11%D0%C0%40%AF%3F%EE%EE%92%94%D6%16X%B5%BCMH%15%2F%BF%D4%A7%C87%F1%8E%F2%81%AE%AAvzr%DA2%ABV%17%7C%E63%83%E7I%DC%C6%0Bs%1B%EF6%1E%00%00%00%00%00%00%00%00%00%80cr%9CW%FF%7F%C6%01%0E%F1%CE%A5%84%B3%CA%BC%E0%CB%AA%84%CE%F9%BF)%EC%13%08WU%AE%AB%B1%AE%2BO%EC%8E%CBYe%FE%8CN%ABr%5Dy%60~%CFA%0D%F4%AE%D4%BE%C75%CA%EDVB%EA(%B7%F1%09g%E5%D9%12%00%00%00%00%00%00%00%00%00H%F6%EB%13S%E7y%5E%5E%FB%98%F0%22%D1%B2'%A7%F0%92%B1%BC%24z3%AC%7Dm%60%D5%92%B4%7CEUO%5E%F0%AA*%3BU%B9%AE%3E%A0j%94%07%A0%C7%A0%AB%FD%B5%3F%A0%F7%03T%3Dy%D7%F7%D6%D4%C0%AAU%D2%E6%DFt%3F%A8%CC%AA%F2%86%B9%D7%F5%1F%18%E6%01%F8%CC%D5%9E%F0%F3z%88%AA%90%EF%20%00%00%00%00%00%00%00%00%00%C0%A6%D3%EA%CFi%AFb%2C%7BB%0A%2B%C3%1A%D7%06V%D5%07%A8r%5D%3D%D9%A6%CAu%F5%25%CF%A2%99%97zNX%60%95%AB%5DUZ%D5%FBR%03%AB%1C%D4k%9F%3F%BB%5C%FF%81a%AE%AB'%7F%F3%EA%FE%F3z%94%AA%D8%DF%5B%01%00%00%00%00%00%00%00%00%00%8E%FB%F3%F2%B1%1B%8DWU%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*UiU%C7%BBe%E7%F3%B9%CB%AAJ%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5*%AAj%FD%C6%D4%5Eo%90%B5Z%ADV%AB%D5j%B5Z%ADV%AB%D5j%B5Z%ADV%AB%D5j%B5Z%ADV%AB%D5j%B5Z%ADV%AB%D5j%B5Z%ADV%AB%D5j%B5Z%ADV%AB%D5j%B5%86%AF%1B%9F%98%DA%EBm%BBV%AB%D5j%B5Z%ADV%AB%D5j%B5Z%ADV%AB%D5j%B5Z%ADV%AB%D5j%B5Z%ADV%AB%D5j%B5Z%ADV%AB%D5j%B5Z%ADV%AB%D5j%B5Z%AD%D6%E4%F58%01%00%00%00%00%00%00%00%00%00%00%00%00%00%40%85%7F%02%0C%008%C2%D0H%16j%8FX%00%00%00%00IEND%AEB%60%82") repeat-x !important;
    border-top: 1px solid #BBBBBB !important;
    border-right: 1px dashed #BBBBBB !important;
    border-bottom: 1px solid #000000 !important;
}

.firebugRulerV {
    top: 0 !important;
    left: -15px !important;
    width: 14px !important;
    height: 100% !important;
    background: url("data:image/png,%89PNG%0D%0A%1A%0A%00%00%00%0DIHDR%00%00%00%0E%00%00%13%88%08%02%00%00%00%0E%F5%CB%10%00%00%00%04gAMA%00%00%D6%D8%D4OX2%00%00%00%19tEXtSoftware%00Adobe%20ImageReadyq%C9e%3C%00%00%06~IDATx%DA%EC%DD%D1v%A20%14%40Qt%F1%FF%FF%E4%97%D9%07%3BT%19%92%DC%40(%90%EEy%9A5%CB%B6%E8%F6%9Ac%A4%CC0%84%FF%DC%9E%CF%E7%E3%F1%88%DE4%F8%5D%C7%9F%2F%BA%DD%5E%7FI%7D%F18%DDn%BA%C5%FB%DF%97%BFk%F2%10%FF%FD%B4%F2M%A7%FB%FD%FD%B3%22%07p%8F%3F%AE%E3%F4S%8A%8F%40%EEq%9D%BE8D%F0%0EY%A1Uq%B7%EA%1F%81%88V%E8X%3F%B4%CEy%B7h%D1%A2E%EBohU%FC%D9%AF2fO%8BBeD%BE%F7X%0C%97%A4%D6b7%2Ck%A5%12%E3%9B%60v%B7r%C7%1AI%8C%BD%2B%23r%00c0%B2v%9B%AD%CA%26%0C%1Ek%05A%FD%93%D0%2B%A1u%8B%16-%95q%5Ce%DCSO%8E%E4M%23%8B%F7%C2%FE%40%BB%BD%8C%FC%8A%B5V%EBu%40%F9%3B%A72%FA%AE%8C%D4%01%CC%B5%DA%13%9CB%AB%E2I%18%24%B0n%A9%0CZ*Ce%9C%A22%8E%D8NJ%1E%EB%FF%8F%AE%CAP%19*%C3%BAEKe%AC%D1%AAX%8C*%DEH%8F%C5W%A1e%AD%D4%B7%5C%5B%19%C5%DB%0D%EF%9F%19%1D%7B%5E%86%BD%0C%95%A12%AC%5B*%83%96%CAP%19%F62T%86%CAP%19*%83%96%CA%B8Xe%BC%FE)T%19%A1%17xg%7F%DA%CBP%19*%C3%BA%A52T%86%CAP%19%F62T%86%CA%B0n%A9%0CZ%1DV%C6%3D%F3%FCH%DE%B4%B8~%7F%5CZc%F1%D6%1F%AF%84%F9%0F6%E6%EBVt9%0E~%BEr%AF%23%B0%97%A12T%86%CAP%19%B4T%86%CA%B8Re%D8%CBP%19*%C3%BA%A52huX%19%AE%CA%E5%BC%0C%7B%19*CeX%B7h%A9%0C%95%E1%BC%0C%7B%19*CeX%B7T%06%AD%CB%5E%95%2B%BF.%8F%C5%97%D5%E4%7B%EE%82%D6%FB%CF-%9C%FD%B9%CF%3By%7B%19%F62T%86%CA%B0n%D1R%19*%A3%D3%CA%B0%97%A12T%86uKe%D0%EA%B02*%3F1%99%5DB%2B%A4%B5%F8%3A%7C%BA%2B%8Co%7D%5C%EDe%A8%0C%95a%DDR%19%B4T%C66%82fA%B2%ED%DA%9FC%FC%17GZ%06%C9%E1%B3%E5%2C%1A%9FoiB%EB%96%CA%A0%D5qe4%7B%7D%FD%85%F7%5B%ED_%E0s%07%F0k%951%ECr%0D%B5C%D7-g%D1%A8%0C%EB%96%CA%A0%A52T%C6)*%C3%5E%86%CAP%19%D6-%95A%EB*%95q%F8%BB%E3%F9%AB%F6%E21%ACZ%B7%22%B7%9B%3F%02%85%CB%A2%5B%B7%BA%5E%B7%9C%97%E1%BC%0C%EB%16-%95%A12z%AC%0C%BFc%A22T%86uKe%D0%EA%B02V%DD%AD%8A%2B%8CWhe%5E%AF%CF%F5%3B%26%CE%CBh%5C%19%CE%CB%B0%F3%A4%095%A1%CAP%19*Ce%A8%0C%3BO*Ce%A8%0C%95%A12%3A%AD%8C%0A%82%7B%F0v%1F%2FD%A9%5B%9F%EE%EA%26%AF%03%CA%DF9%7B%19*Ce%A8%0C%95%A12T%86%CA%B8Ze%D8%CBP%19*Ce%A8%0C%95%D1ae%EC%F7%89I%E1%B4%D7M%D7P%8BjU%5C%BB%3E%F2%20%D8%CBP%19*Ce%A8%0C%95%A12T%C6%D5*%C3%5E%86%CAP%19*Ce%B4O%07%7B%F0W%7Bw%1C%7C%1A%8C%B3%3B%D1%EE%AA%5C%D6-%EBV%83%80%5E%D0%CA%10%5CU%2BD%E07YU%86%CAP%19*%E3%9A%95%91%D9%A0%C8%AD%5B%EDv%9E%82%FFKOee%E4%8FUe%A8%0C%95%A12T%C6%1F%A9%8C%C8%3D%5B%A5%15%FD%14%22r%E7B%9F%17l%F8%BF%ED%EAf%2B%7F%CF%ECe%D8%CBP%19*Ce%A8%0C%95%E1%93~%7B%19%F62T%86%CAP%19*Ce%A8%0C%E7%13%DA%CBP%19*Ce%A8%0CZf%8B%16-Z%B4h%D1R%19f%8B%16-Z%B4h%D1R%19%B4%CC%16-Z%B4h%D1R%19%B4%CC%16-Z%B4h%D1%A2%A52%CC%16-Z%B4h%D1%A2%A52h%99-Z%B4h%D1%A2%A52h%99-Z%B4h%D1%A2EKe%98-Z%B4h%D1%A2EKe%D02%5B%B4h%D1%A2EKe%D02%5B%B4h%D1%A2E%8B%96%CA0%5B%B4h%D1%A2E%8B%96%CA%A0e%B6h%D1%A2E%8B%96%CA%A0e%B6h%D1%A2E%8B%16-%95a%B6h%D1%A2E%8B%16-%95A%CBl%D1%A2E%8B%16-%95A%CBl%D1%A2E%8B%16-Z*%C3l%D1%A2E%8B%16-Z*%83%96%D9%A2E%8B%16-Z*%83%96%D9%A2E%8B%16-Z%B4T%86%D9%A2E%8B%16-Z%B4T%06-%B3E%8B%16-Z%B4T%06-%B3E%8B%16-Z%B4h%A9%0C%B3E%8B%16-Z%B4h%A9%0CZf%8B%16-Z%B4h%A9%0CZf%8B%16-Z%B4h%D1R%19f%8B%16-Z%B4h%D1R%19%B4%CC%16-Z%B4h%D1R%19%B4%CC%16-Z%B4h%D1%A2%A52%CC%16-Z%B4h%D1%A2%A52h%99-Z%B4h%D1%A2%A52h%99-Z%B4h%D1%A2EKe%98-Z%B4h%D1%A2EKe%D02%5B%B4h%D1%A2EKe%D02%5B%B4h%D1%A2E%8B%96%CA0%5B%B4h%D1%A2E%8B%96%CA%A0e%B6h%D1%A2E%8B%96%CA%A0e%B6h%D1%A2E%8B%16-%95a%B6h%D1%A2E%8B%16-%95A%CBl%D1%A2E%8B%16-%95A%CBl%D1%A2E%8B%16-Z*%C3l%D1%A2E%8B%16-Z*%83%96%D9%A2E%8B%16-Z*%83%96%D9%A2E%8B%16-Z%B4T%86%D9%A2E%8B%16-Z%B4T%06-%B3E%8B%16-Z%B4T%06-%B3E%8B%16-Z%B4h%A9%0C%B3E%8B%16-Z%B4h%A9%0CZf%8B%16-Z%B4h%A9%0CZf%8B%16-Z%B4h%D1R%19f%8B%16-Z%B4h%D1R%19%B4%CC%16-Z%B4h%D1R%19%B4%CC%16-Z%B4h%D1%A2%A52%CC%16-Z%B4h%D1%A2%A52h%99-Z%B4h%D1%A2%A52h%99-Z%B4h%D1%A2EKe%98-Z%B4h%D1%A2EKe%D02%5B%B4h%D1%A2EKe%D02%5B%B4h%D1%A2E%8B%96%CA0%5B%B4h%D1%A2E%8B%96%CA%A0e%B6h%D1%A2E%8B%96%CA%A0e%B6h%D1%A2E%8B%16-%95a%B6h%D1%A2E%8B%16-%95A%CBl%D1%A2E%8B%16-%95A%CBl%D1%A2E%8B%16-Z*%C3l%D1%A2E%8B%16-Z*%83%96%D9%A2E%8B%16-Z*%83%96%D9%A2E%8B%16-Z%B4T%86%D9%A2E%8B%16-Z%B4T%06-%B3E%8B%16-Z%B4%AE%A4%F5%25%C0%00%DE%BF%5C'%0F%DA%B8q%00%00%00%00IEND%AEB%60%82") repeat-y !important;
    border-left: 1px solid #BBBBBB !important;
    border-right: 1px solid #000000 !important;
    border-bottom: 1px dashed #BBBBBB !important;
}

.overflowRulerX > .firebugRulerV {
    left: 0 !important;
}

.overflowRulerY > .firebugRulerH {
    top: 0 !important;
}

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
.fbProxyElement {
    position: fixed !important;
    pointer-events: auto !important;
}
a:link {
 text-decoration: none;
}
a:visited {
 text-decoration: none;
}
a:hover {
 text-decoration: none;
}
a:active {
 text-decoration: none;
}
</style>
<script type="text/javascript" src="<%=request.getContextPath()%>/prefer/tp1/style/prototype.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/prefer/tp1/style/core.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/prefer/tp1/style/converter.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/prefer/tp1/style/Unibon.js"></script>
</head>
<body style="font: 14px/1.5 Microsoft YaHei, Helvitica, Verdana, Arial, san-serif;">
    <form method="post" action="default.aspx?id=1" id="form1">
    <div id="PicForm" class="content">
        <img src="<%=request.getContextPath()%>/prefer/tp1/style/p1_01.jpg" id="imgTitle" alt="规则" style="width: 100%; height: auto">       
        <div class="control1">
            <div class="action" ext="0" id="btnJoin" style="background-color: rgb(57, 135, 71); font-size: 4vw; width: 96%;"><a style="color:#FFFFFF;" href="<%=request.getContextPath()%>/prefer/p4/p4.jsp">我要报名</a></div>
        </div>
		<div class="control1">
			<div class="action" style="padding:4%;box-shadow: 2px 2px 1px #848484;">参赛选手</div>
			<div class="action" style="padding:4%;background-color: #df64a4;box-shadow: 2px 2px 1px #848484;">活动介绍</div>
			<div class="action" style="padding:4%;background-color: #64aedf;box-shadow: 2px 2px 1px #848484;">活动奖品</div>
		</div>
        <div class="count">           
            <span class="action" style="width: 33%;">参与人数<br>${cyrs }</span>
            <span class="action" style="width: 34%; left: 33%">累计投票<br>${ljtp }</span>
            <span class="action" style="width: 33%; left: 67%">排行榜<br>${ljtp }</span>
        </div>
		<div style="float:left;height:12vw;padding-top:6px;width:100%;margin-top: 4%;">
			<a href="javascript:void(0);" onclick="ShowSearch()"><div style="background: #fff none repeat scroll 0 0;border-radius: 8px;color: #000000;display: block;float: left;font-size: 4vw;padding: 2%;text-align: center;width: 90%;margin-left:3%;">快速查询</div></a>
		</div>
        <p class="pager">
        <c:if test="${(flage) != 1}">
        <c:if test="${(currentPage+1) != 1}">
        	<a href='<%=request.getContextPath()%>/baby/getAllBabyList?currentPage=${currentPage-1}&openId=${openId }' class="itm">上一页</a>
        </c:if>
        <a>${currentPage+1}/${pageCount}页 </a>
        <c:if test="${(currentPage+1) != pageCount}">
        	<a href='<%=request.getContextPath()%>/baby/getAllBabyList?currentPage=${currentPage+1}&openId=${openId }' class="itm">下一页</a>
        </c:if>
        </c:if>
        </p>
       
        <div class="pic-form left-form">
	        <c:if test="${!empty babyList1 }">
	        	<c:forEach items="${babyList1 }" var="baby1">
			        <div class="item">
			        <a href='<%=request.getContextPath()%>/baby/getBabyById?csbh=${baby1.csbh }&openId=${openId }' class="itm">
			        	<img class="image" alt="${baby1.name }" src="http://7xjg0r.com1.z0.glb.clouddn.com/${baby1.picture }">
			        </a>	
			        	<div class="txt">
			        		<span class="no">No.${baby1.csbh } ${baby1.name }</span> 
			        		<span class="votes">${baby1.tps }票</span>
			        	</div>
   						<input type="hidden" id="openId" name="openId" value="${openId }"/>
			        	<a href="javascript:void(0);" class="action" onclick="DoVote('${baby1.csbh}',${baby1.tps })">点赞</a>

			        </div>
		        </c:forEach>
		    </c:if>
        </div>
               
      <div class="pic-form right-form">
        <c:if test="${!empty babyList2 }">
	        	<c:forEach items="${babyList2 }" var="baby2">
			        <div class="item">
			        <a href='<%=request.getContextPath()%>/baby/getBabyById?csbh=${baby2.csbh }&openId=${openId }' class="itm">
			        	<img class="image" alt="${baby2.name }" src="http://7xjg0r.com1.z0.glb.clouddn.com/${baby2.picture }">
			        </a>
			        	<div class="txt">
			        		<span class="no">No.${baby2.csbh } ${baby2.name }</span> 
			        		<span class="votes">${baby2.tps }票</span>
			        	</div>
			        	<input type="hidden" id="csbh2" name="csbh2" value="${baby2.csbh }"/>
			        	<a href="javascript:void(0);" class="action" onclick="DoVote('${baby2.csbh}',${baby2.tps })">点赞</a>

			        </div>
		        </c:forEach>
		    </c:if>
      </div>
        
        <div style="padding-bottom: 80px; float: left; clear: both; width: 100%;">
            <!-- <p class="pager"><a>1/166页 </a><a href="" class="itm">下一页</a></p> -->
        </div>
    </div>
    <div class="control">
        <img alt="" src="<%=request.getContextPath()%>/prefer/tp1/style/vote-bottom.png" style="width: 100%; height: auto">
        <a class="action" href="tel:0571-123456"></a>
        <a class="action" onclick="ShowSearch()" style="left: 33%; width: 34%;"></a>
        <a class="action" href="javascript:void(0);" onclick="ShowRank()" style="left: 67%;"></a>
    </div>
    
    <div style="display: none;" class="search">
        <div> 请输入选手编号或姓名：</div>
        <div>
            <input name="txtSearch" id="txtSearch" class="c" type="text">
        </div>
        <a class="join" href="javascript:void(0);" onclick="DoSearch()">搜 索</a>
    </div>
    
    <div class="rank" id="rank">
        <div class="rank-body">
            <table class="rank-list" border="1" cellpadding="0" cellspacing="0" width="100%">
                <tbody><tr>
                    <th>排名</th>
                    <th>参赛编号</th>
                    <th>宝贝姓名</th>
                    <th>得票数</th>
                </tr>
                </tbody>
                <tbody id="rank-value">
                </tbody>
            </table>
        </div>
        <a class="close" onclick="$('#rank').hide()">×</a>
    </div>
    <div class="rank" id="record">
        <div class="rank-body">
            <table class="rank-list" border="1" cellpadding="0" cellspacing="0" width="100%">
                <tbody>
                <tr>
                    <th>编号</th>
                    <th>选手</th>
                    <th>投票时间</th>
                </tr>
                </tbody>
                <tbody id="record-value">
                </tbody>
            </table>
        </div>
        <a class="close" onclick="$('#record').hide()">×</a>
    </div>
    <div class="other" id="other1">
        <div class="tip">如何投票：<br>
            搜索微信公众号：闪耀浙分客服节。添加关注，点击界面下方的“我是小明星”进入页面搜索萌宝姓名或编号，点击”亲一下“，即可为心目中的萌宝投票！
            <a class="close" onclick="$('#other1').hide()">我知道了</a>
        </div>
    </div>
    <div class="other" id="other2">
        <div class="tip">您已参与投票！<br>
            
            <a class="close" onclick="$('#other2').hide()">我知道了</a>
        </div>
    </div>
    <div class="screen"></div>
    <div class="dialog loading">
        <i class="mask"></i>
    </div>
    <div class="dialog alert">
        <i class="form"><span class="txt">提示</span> <a onclick="HideAlert()">确定</a> </i>
    </div>
    </form>
    <script type="text/javascript" src="<%=request.getContextPath()%>/prefer/tp1/style/jquery.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/prefer/tp1/style/common.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/prefer/tp1/style/jweixin-1.js"></script>
    <script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
    <script type="text/javascript">
        var scrolling = false;
        var scrollTimer;
        var loadTimer;
        var items = [];
        var picForm;
        var loading;
        var numIdx = 0;
        var _offsetTop = 0;
        var _screenHeight = 0;
        $(document).ready(function () {
            _screenHeight = $(".screen").height();
            $(window).scroll(function () {
                scrolling = true;
                clearTimeout(scrollTimer);
                scrollTimer = setTimeout("CheckScroll()", 200);
            });

            $(".image").each(function (i) {
                var o = $(this);
                if (i < 10) {
                    o.attr("load", "1");
                    o.attr("src", o.attr("data-src"));
                }
                items.push(o.attr("data-src"));
            });

            $(".image").click(function () {
               // window.location = "item.aspx?openid=" + who + "&id=" + $(this).attr("itm") + "&usign=" + usign;
            });

            loading = $(".loading");

            if (who != "" && usign == "") {
                $("#other2").show();
            }
        });

        function CheckScroll() {
            scrolling = false;
            clearTimeout(loadTimer);
            setTimeout("LoadImage()", 200);
        }

        function LoadImage() {
            if (!scrolling) {
                var scrollTop = $(document).scrollTop();
                $(".item").find(".image[load='0']").each(function () {
                    var o = $(this);
                    var offsetTop = o.position().top;
                    var height = o.height();
                    if ((offsetTop - scrollTop) >= (_offsetTop - height) && (offsetTop - scrollTop) <= _screenHeight) {
                        o.attr("load", "1");
                        o.attr("src", o.attr("data-src"));
                    }
                });
            }
        }

        function ShowRank() {
        	$.ajax({
				  type: 'POST',
				  url:'<%=request.getContextPath()%>/baby/getAllBabyRank',
				  datatype:"json",
				  success:function(data){
					  var dataObj=eval("("+data+")"); 
					  var str = '';
					  for(var i=0;i<dataObj.length;i++){ 	
						  str = str+"<tr><td>"+dataObj[i].num+"</td><td>"+dataObj[i].csbh+"</td><td>"+dataObj[i].name+"</td><td>"+dataObj[i].tps+"</td></tr>";				       
						     
				        }  
					  document.getElementById("rank-value").innerHTML = str;  
				  },	
				  //调用出错执行的函数
		            error: function(){
		                alert("error");
		            }
				}); 
        	$("#rank").show();

        }

        function ShowSearch() {
            $(".search").show();
        }

        function DoVote(csbh,tps) {
        	var openId = document.getElementById("openId").value; 
        	if(openId==''){
            	$("#other1").show();
        	}else{
        		$.ajax({
  				  type: 'POST',
  				  url:'<%=request.getContextPath()%>/baby/tpBaby',
  				  data:{ openId: openId, csbh: csbh },
  				  datatype:"text",
  				  success:function(data){
  					 if(data==tps)
  						 {
  						  $("#other2").show();
  						 }
  					 $('.votes').html(data);
  				  },	
  				  //调用出错执行的函数
  		            error: function(){
  		                alert("error");
  		            }
  				});  
        	}   	       	
        }

        function DoSearch() {
            var csbh = $("#txtSearch").val();
            var openId = $("#openId").val();
            if (typeof(openId) != "undefined"){
            	if (csbh != "") {
                    window.location = "<%=request.getContextPath()%>/baby/getBabyByCsbh?csbh="+csbh+"&openId="+openId;
                }
            }else{
            	if (csbh != "") {
                    window.location = "<%=request.getContextPath()%>/baby/getBabyByCsbh?csbh="+csbh;
                }
            }
            $(".search").hide();
        }
    </script>
    <script type="text/javascript">
    $(document).ready(function(){
    	var url = location.href.split('#')[0];
    	//url='http://yrweixin2.hundsun.cn/kfj/baby/getAllBabyList';
    	$.ajax({
    		type: 'POST',
    		url:'<%=request.getContextPath()%>/WXController/getSingInfo',
			data:{ url: url },
			datatype:"json",     
    	    error:function(){     
    	       alert('error');
    	    },     
    	    success:function(data){
    	       data=eval("("+data+")");//转换为json对象
    	       var appid = data.appid;
    	       var timestamp = data.timestamp;
    	       var nonceStr = data.nonceStr;
    	       var signature = data.signature;
    	       var domain = data.domain;
    	       //注册事件
    	       wx.config({
    	    	    debug: false,
    	    	    appId: appid,
    	    	    timestamp: timestamp,
    	    	    nonceStr: nonceStr,
    	    	    signature: signature,
    	    	    jsApiList: [
    	    	      'checkJsApi',
    	    	      'onMenuShareTimeline',
    	    	      'onMenuShareAppMessage'
    	    	    ]
    	    	});
    	       
    	       	wx.error(function (res) {
    	    		//alert(res.errMsg);
    	    	});
    	       
    	       	wx.ready(function () {
    	       		wx.onMenuShareAppMessage({
    	       		    title: '我是小明星',
    	       		    desc: '下载平安人寿APP，参加我是小明星电视评选大赛，获取旅游大奖,暑假带孩子玩遍世界...',
    	       		    link: domain+'<%=request.getContextPath()%>/baby/getAllBabyList',
    	       		    imgUrl: domain+'<%=request.getContextPath()%>/prefer/p1/style/p1_01.jpg',
    	       		    trigger: function (res) {
    	       		      //alert('用户点击发送给朋友');
    	       		    },
    	       		    success: function (res) {
    	       		      //alert('已分享');
    	       		    },
    	       		    cancel: function (res) {
    	       		      //alert('已取消');
    	       		    },
    	       		    fail: function (res) {
    	       		      //alert(JSON.stringify(res));
    	       		    }
    	       		  });
    	       		
    	       		wx.onMenuShareTimeline({
    	       			title: '我是小明星',
    	       		    desc: '下载平安人寿APP，参加我是小明星电视评选大赛，获取旅游大奖,暑假带孩子玩遍世界...',
    	       		 	link: domain+'<%=request.getContextPath()%>/baby/getAllBabyList',
 	       		    	imgUrl: domain+'<%=request.getContextPath()%>/prefer/p1/style/p1_01.jpg',
    	       		    trigger: function (res) {
    	       		      //alert('用户点击分享到朋友圈');
    	       		    },
    	       		    success: function (res) {
    	       		      //alert('已分享');
    	       		    },
    	       		    cancel: function (res) {
    	       		      //alert('已取消');
    	       		    },
    	       		    fail: function (res) {
    	       		      //alert(JSON.stringify(res));
    	       		    }
    	       		  });
    	       		
    	       	});   	       
    	    }  
    	});
    });
    </script>
</body>
</html>