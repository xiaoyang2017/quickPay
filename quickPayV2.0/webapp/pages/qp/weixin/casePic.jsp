<!DOCTYPE html>
<%@ include file="/common/taglibs.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<html>
<head>
<%@ include file="/common/i18njs.jsp"%>
<%@ include file="/common/meta_js.jsp"%>
<meta http-equiv="Content-Type" content="application/json" charset="utf-8">
<meta name="keywords" content="照片展示">
<meta name="description" content="照片展示">
<meta name="viewport" id="viewport" content="width = device-width, initial-scale = 1, minimum-scale = 1, maximum-scale = 1">
<link rel="stylesheet" href="${ctx }/pages/qp/weixin/resources/css/common.css">
<link rel="stylesheet" href="${ctx }/pages/qp/weixin/resources/css/index.css">
<script src="${ctx}/pages/qp/qpticpicturegroup/js/photoswipe.min.js"></script> 
<script src="${ctx}/pages/qp/qpticpicturegroup/js/photoswipe-ui-default.min.js"></script> 
<script src="${ctx}/pages/qp/qpticpicturegroup/js/lyz.delayLoading.min.js" type="text/javascript"></script>
<link href="/widgets/bootstrap-3.2.0/css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" href="${ctx}/pages/qp/qpticpicturegroup/css/photoswipe.css"> 
<link rel="stylesheet" href="${ctx}/pages/qp/qpticpicturegroup/css/default-skin/default-skin.css">
<title>照片展示</title>
<style type="text/css">
.pnav {
	margin-top: 30px;
	text-align: center;
	line-height: 24px;
	font-size: 16px
}

.pnav a {
	padding: 4px
}

.pnav a.cur {
	background: #007bc4;
	color: #fff;
}

.my-gallery {
	width: 100%;
	float: left;
}

.my-gallery figure {
	width:33%;
	float: left;
	margin-left:1px;
	margin-top:1px;
}

.my-gallery figure img {
	width:100%;
}

.my-gallery figcaption {
	display: none;
}
</style>
</head>
<body>
	<div class="photoShowDivHide" style="display: block">
		<header>
			<a class="leftBtn" onclick="javascript:window.history.go(-1);"></a>照片展示
		</header>
		<!--上传照片列表-->
		<c:if test="${empty filePathList }">
			<h3>暂无图片&nbsp;</h3>
		</c:if>
		<div class="my-gallery">
			<c:forEach var="file" items="${filePathList }">
				<figure>
					<a href="${ctx}${file.fileName}" >
						<img originalsrc="${ctx}${file.fileName}" alt="Image description" />
					</a>
					<figcaption itemprop="caption description">${file.picDesc}</figcaption>
				</figure>
			</c:forEach>
		</div>
		<div class="pswp" tabindex="-1" role="dialog" aria-hidden="true">
			<div class="pswp__bg"></div>
			<div class="pswp__scroll-wrap">
				<div class="pswp__container">
					<div class="pswp__item"></div>
					<div class="pswp__item"></div>
					<div class="pswp__item"></div>
				</div>
				<div class="pswp__ui pswp__ui--hidden">
					<div class="pswp__top-bar">
						<div class="pswp__counter"></div>
						<button class="pswp__button pswp__button--close" title="Close (Esc)"></button>
						<button class="pswp__button pswp__button--share" title="Share"></button>
						<button class="pswp__button pswp__button--fs" title="Toggle fullscreen"></button>
						<button class="pswp__button pswp__button--zoom" title="Zoom in/out"></button>
						<div class="pswp__preloader">
							<div class="pswp__preloader__icn">
								<div class="pswp__preloader__cut">
									<div class="pswp__preloader__donut"></div>
								</div>
							</div>
						</div>
					</div>
					<div class="pswp__share-modal pswp__share-modal--hidden pswp__single-tap">
						<div class="pswp__share-tooltip"></div> 
					</div>
					<button class="pswp__button pswp__button--arrow--left" title="Previous (arrow left)"></button>
					<button class="pswp__button pswp__button--arrow--right" title="Next (arrow right)"></button>
					<div class="pswp__caption">
						<div class="pswp__caption__center"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(function () {
		$("img").delayLoading({
			defaultImg: "${ctx}/pages/qp/qpticpicturegroup/images/loading.jpg",           // 预加载前显示的图片
			errorImg: "",                        // 读取图片错误时替换图片(默认：与defaultImg一样)
			imgSrcAttr: "originalSrc",           // 记录图片路径的属性(默认：originalSrc，页面img的src属性也要替换为originalSrc)
			beforehand: 0,                       // 预先提前多少像素加载图片(默认：0)
			event: "scroll",                     // 触发加载图片事件(默认：scroll)
			duration: "normal",                  // 三种预定淡出(入)速度之一的字符串("slow", "normal", or "fast")或表示动画时长的毫秒数值(如：1000),默认:"normal"
			container: window,                   // 对象加载的位置容器(默认：window)
			success: function (imgObj) { },      // 加载图片成功后的回调函数(默认：不执行任何操作)
			error: function (imgObj) { }         // 加载图片失败后的回调函数(默认：不执行任何操作)
		});
	});
	
	var initPhotoSwipeFromDOM = function(gallerySelector) {
		var parseThumbnailElements = function(el) {
			var thumbElements = el.childNodes, numNodes = thumbElements.length, items = [], figureEl, linkEl, size, item;
			for ( var i = 0; i < numNodes; i++) {
				figureEl = thumbElements[i];
				if (figureEl.nodeType !== 1) {
					continue;
				}
				linkEl = figureEl.children[0];
				imgEl = linkEl.children[0];
				var img = new Image();
				img.src = imgEl.getAttribute('src');
				item = {
					src : linkEl.getAttribute('href'),
					w : img.width,
					h : img.height
				};
				if (figureEl.children.length > 1) {
					item.title = figureEl.children[1].innerHTML;
				}
				if (linkEl.children.length > 0) {
					item.msrc = linkEl.children[0].getAttribute('src');
				}
				item.el = figureEl;
				items.push(item);
			}
			return items;
		};
		var closest = function closest(el, fn) {
			return el && (fn(el) ? el : closest(el.parentNode, fn));
		};
		var onThumbnailsClick = function(e) {
			e = e || window.event;
			e.preventDefault ? e.preventDefault() : e.returnValue = false;
			var eTarget = e.target || e.srcElement;
			var clickedListItem = closest(eTarget, function(el) {
				return (el.tagName && el.tagName.toUpperCase() === 'FIGURE');
			});
			if (!clickedListItem) {
				return;
			}
			var clickedGallery = clickedListItem.parentNode, childNodes = clickedListItem.parentNode.childNodes, numChildNodes = childNodes.length, nodeIndex = 0, index;
			for ( var i = 0; i < numChildNodes; i++) {
				if (childNodes[i].nodeType !== 1) {
					continue;
				}
				if (childNodes[i] === clickedListItem) {
					index = nodeIndex;
					break;
				}
				nodeIndex++;
			}
			if (index >= 0) {
				openPhotoSwipe(index, clickedGallery);
			}
			return false;
		};
		var photoswipeParseHash = function() {
			var hash = window.location.hash.substring(1), params = {};
			if (hash.length < 5) {
				return params;
			}
			var vars = hash.split('&');
			for ( var i = 0; i < vars.length; i++) {
				if (!vars[i]) {
					continue;
				}
				var pair = vars[i].split('=');
				if (pair.length < 2) {
					continue;
				}
				params[pair[0]] = pair[1];
			}
			if (params.gid) {
				params.gid = parseInt(params.gid, 10);
			}
			return params;
		};
		var openPhotoSwipe = function(index, galleryElement, disableAnimation,
				fromURL) {
			var pswpElement = document.querySelectorAll('.pswp')[0], gallery, options, items;
			items = parseThumbnailElements(galleryElement);
			options = {
				galleryUID : galleryElement.getAttribute('data-pswp-uid'),
				getThumbBoundsFn : function(index) {
					var thumbnail = items[index].el.getElementsByTagName('img')[0], // find thumbnail
					pageYScroll = window.pageYOffset
							|| document.documentElement.scrollTop, rect = thumbnail
							.getBoundingClientRect();
					return {
						x : rect.left,
						y : rect.top + pageYScroll,
						w : rect.width
					};
				}
			};
			if (fromURL) {
				if (options.galleryPIDs) {
					for ( var j = 0; j < items.length; j++) {
						if (items[j].pid == index) {
							options.index = j;
							break;
						}
					}
				} else {
					options.index = parseInt(index, 10) - 1;
				}
			} else {
				options.index = parseInt(index, 10);
			}
			if (isNaN(options.index)) {
				return;
			}
			if (disableAnimation) {
				options.showAnimationDuration = 0;
			}
			gallery = new PhotoSwipe(pswpElement, PhotoSwipeUI_Default, items,
					options);
			gallery.init();
		};
		var galleryElements = document.querySelectorAll(gallerySelector);
		for ( var i = 0, l = galleryElements.length; i < l; i++) {
			galleryElements[i].setAttribute('data-pswp-uid', i + 1);
			galleryElements[i].onclick = onThumbnailsClick;
		}
		var hashData = photoswipeParseHash();
		if (hashData.pid && hashData.gid) {
			openPhotoSwipe(hashData.pid, galleryElements[hashData.gid - 1],
					true, true);
		}
	};
	initPhotoSwipeFromDOM('.my-gallery');
</script>
</html>