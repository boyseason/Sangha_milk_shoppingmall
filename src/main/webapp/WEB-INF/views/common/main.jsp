<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형웹  적용 -->
<meta name="viewport" content="width=device-width, initial-scale-1">
<title>main</title>

<link rel="stylesheet" href="${path}/resources/css/commonCss/header.css">
<link rel="stylesheet" href="${path}/resources/css/commonCss/footer.css">
<link rel="stylesheet" href="${path}/resources/css/commonCss/main.css">

<!-- 1. fontawesome.com에서 인증(start for free) 2. 이미지 사용가능 -->
<script src="https://kit.fontawesome.com/980ab78713.js" crossorigin="anonymous"></script>

</head>
<body>

<div class="wrap">
   <!-- header 시작 -->
   <%@ include file="header.jsp" %>
   <!-- header 끝 -->
   
   <!-- UserLoginSuccessHandler 에서 msg 넘김 -->
   <c:if test="${msg != null}">
      <script type="text/javascript">
         alert("${msg}");
      </script>
   </c:if>
   
   
   <!-- 컨텐츠 시작 -->
	<div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel">
  		<div class="carousel-indicators">
    		<button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    		<button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1" aria-label="Slide 2"></button>
    		<button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2" aria-label="Slide 3"></button>
    		<button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="3" aria-label="Slide 4"></button>
    		<button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="4" aria-label="Slide 5"></button>
    		<button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="5" aria-label="Slide 6"></button>
  		</div>
  		<div class="carousel-inner" >
    		<div class="carousel-item active" data-bs-interval="10000">
      			<img src="${path}/resources/css/images/cold_ice1.JPG" class="d-block" alt="..." style="margin-left: auto; margin-right: auto; width:500px; height: 650px;">
    		</div>
    		<div class="carousel-item" data-bs-interval="2000">
      			<img src="${path}/resources/css/images/cold_ice2.JPG" class="d-block" alt="..." style="margin-left: auto; margin-right: auto; width:500px; height: 650px;">
    		</div>
    		<div class="carousel-item">
      			<img src="${path}/resources/css/images/cold_ice3.JPG" class="d-block" alt="..." style="margin-left: auto; margin-right: auto; width:500px; height: 650px;">
    		</div>
    		<div class="carousel-item">
      			<img src="${path}/resources/css/images/cold_ice4.JPG" class="d-block" alt="..." style="margin-left: auto; margin-right: auto; width:500px; height: 650px;">
    		</div>
    		<div class="carousel-item">
      			<img src="${path}/resources/css/images/you_ice3.JPG" class="d-block" alt="..." style="margin-left: auto; margin-right: auto; width:500px; height: 650px;">
    		</div>
    		<div class="carousel-item">
      			<img src="${path}/resources/css/images/you_ice5.JPG" class="d-block" alt="..." style="margin-left: auto; margin-right: auto; width:500px; height: 650px;">
    		</div>
  		</div>
  		<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
    		<span class="carousel-control-prev-icon" aria-hidden="true"></span>
    		<span class="visually-hidden">Previous</span>
  		</button>
  		<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
    		<span class="carousel-control-next-icon" aria-hidden="true"></span>
    		<span class="visually-hidden">Next</span>
  		</button>
	</div>
		
	<ul class="_1bijXwxRam _2ys1d7ECuG _2AarBeuu05">
		<li class="_2txbrXXlXM">
			<a href="${path}/showAll.do" class="_2stzi1AtUa N=a:lst.product linkAnchor">
			<div class="FjO1Bk6iPK"></div>
				<div class="_2nYI9WkxU9">
				<div class="_2Tr9BUxNo4">
					<div class="_2JNWBGd-04 _3uKZ70Wwcp EnqpMc_sIs">
						<img class="_25CKxIKjAk" src="https://shop-phinf.pstatic.net/20220812_143/1660263367674nBDOC_JPEG/61399151385189711_1586050210.jpg?type=f232_232" alt="[상하목장] 얼려먹는 아이스크림 초코 85ml 24개입">
					</div>
				</div>
			</div>
			<strong class="_3E2b29u49p">[상하목장] 얼려먹는 아이스크림 초코 85ml 24개입</strong>
			<div class="ZAfIG5c7RT">
				<strong><span class="_1mMufyjSsw">26,400</span>원</strong>
			</div>
		</a>
	</li>
	<li class="_2txbrXXlXM">
		<a href="${path}/showAll.do" class="_2stzi1AtUa N=a:lst.product linkAnchor">
			<div class="FjO1Bk6iPK"></div>
			<div class="_2nYI9WkxU9">
				<div class="_2Tr9BUxNo4">
					<div class="_2JNWBGd-04 _3uKZ70Wwcp EnqpMc_sIs">
						<img class="_25CKxIKjAk" src="https://shop-phinf.pstatic.net/20220704_122/1656898012398fDAMF_JPEG/58033847201268837_1827178114.jpg?type=f232_232" alt="[상하목장] 유기농아이스크림 밀크 474ml 2개+ 딸기 474mL 1개">
					</div>
				</div>
			</div>
			<strong class="_3E2b29u49p">[상하목장] 유기농아이스크림 밀크 474ml</strong>
			<div class="ZAfIG5c7RT">
				<strong><span class="_1mMufyjSsw">40,500</span>원</strong>
			</div>
		</a>
	</li>
	<li class="_2txbrXXlXM">
		<a href="${path}/showAll.do" class="_2stzi1AtUa N=a:lst.product linkAnchor">
			<div class="FjO1Bk6iPK"></div>
			<div class="_2nYI9WkxU9">
				<div class="_2Tr9BUxNo4">
					<div class="_2JNWBGd-04 _3uKZ70Wwcp EnqpMc_sIs">
						<img class="_25CKxIKjAk" src="https://shop-phinf.pstatic.net/20220624_244/1656046052924TUp4H_JPEG/57181940738815134_1970747476.jpg?type=f232_232" alt="[상하목장] 얼려먹는 아이스크림 밀크 85ml 24개입">
					</div>
				</div>
			</div>
			<strong class="_3E2b29u49p">[상하목장] 얼려먹는 아이스크림 밀크 85ml 24개입</strong>
			<div class="ZAfIG5c7RT">
				<strong><span class="_1mMufyjSsw">26,400</span>원</strong>
			</div>
		</a>
	</li>
	<li class="_2txbrXXlXM">
		<a href="${path}/showAll.do" class="_2stzi1AtUa N=a:lst.product linkAnchor">
			<div class="FjO1Bk6iPK"></div>
				<div class="_2nYI9WkxU9">
					<div class="_2Tr9BUxNo4"><div class="_2JNWBGd-04 _3uKZ70Wwcp EnqpMc_sIs">
						<img class="_25CKxIKjAk" src="https://shop-phinf.pstatic.net/20220704_29/1656897687806Fomel_JPEG/58033467474884354_421454390.jpg?type=f232_232" alt="[상하목장] 유기농 아이스크림 474ml (밀크1개+딸기1개) 총 2입">
					</div>
				</div>
			</div>
			<strong class="_3E2b29u49p">[상하목장] 유기농 아이스크림 474ml (밀크1개+딸기1개) 총 2입</strong>
			<div class="ZAfIG5c7RT">
				<strong><span class="_1mMufyjSsw">27,000</span>원</strong>
			</div>
		</a>
	</li>
	<li class="_2txbrXXlXM">
		<a href="${path}/showAll.do" class="_2stzi1AtUa N=a:lst.product linkAnchor">
			<div class="FjO1Bk6iPK"></div>
			<div class="_2nYI9WkxU9">
				<div class="_2Tr9BUxNo4">
					<div class="_2JNWBGd-04 _3uKZ70Wwcp EnqpMc_sIs">
						<img class="_25CKxIKjAk" src="https://shop-phinf.pstatic.net/20220713_295/1657676838063hTtAO_JPEG/58812736736716618_1775346170.jpg?type=f232_232" alt="[상하목장] 유기농 아이스크림 100mL 4입(딸기 2개+밀크 2개)">
					</div>
				</div>
			</div>
			<strong class="_3E2b29u49p">[상하목장] 유기농 아이스크림 100mL 4입(딸기 2개+밀크 2개)</strong>
			<div class="ZAfIG5c7RT">
				<strong><span class="_1mMufyjSsw">20,800</span>원</strong>
			</div>
		</a>
	</li>
	
	<li class="_2txbrXXlXM">
		<a href="${path}/showAll.do" class="_2stzi1AtUa N=a:lst.product linkAnchor">
			<div class="FjO1Bk6iPK"></div>
			<div class="_2nYI9WkxU9">
				<div class="_2Tr9BUxNo4">
					<div class="_2JNWBGd-04 _3uKZ70Wwcp EnqpMc_sIs">
						<img class="_25CKxIKjAk" src="https://shop-phinf.pstatic.net/20220713_174/1657677017237Gfd7D_JPEG/58812800917431021_951113981.jpg?type=f232_232" alt="[상하목장] 얼려먹는 아이스크림 초코 85ml 24개입">
					</div>
				</div>
			</div>
			<strong class="_3E2b29u49p">[상하목장] 유기농아이스크림 밀크 100mL 4개</strong>
			<div class="ZAfIG5c7RT">
				<strong><span class="_1mMufyjSsw">20,800</span>원</strong>
			</div>
		</a>
	</li>
	
	<li class="_2txbrXXlXM">
		<a href="${path}/showAll.do" class="_2stzi1AtUa N=a:lst.product linkAnchor">
			<div class="FjO1Bk6iPK"></div>
			<div class="_2nYI9WkxU9">
				<div class="_2Tr9BUxNo4">
					<div class="_2JNWBGd-04 _3uKZ70Wwcp EnqpMc_sIs">
						<img class="_25CKxIKjAk" src="https://shop-phinf.pstatic.net/20220713_242/1657676712200T6QcI_JPEG/58812600889020949_1800843774.jpg?type=f232_232" alt="[상하목장] 얼려먹는 아이스크림 초코 85ml 24개입">
					</div>
				</div>
			</div>
			<strong class="_3E2b29u49p">[상하목장] 유기농아이스크림 딸기 474mLX2개+ 밀크 474mL 1개</strong>
			<div class="ZAfIG5c7RT">
				<strong><span class="_1mMufyjSsw">40,500</span>원</strong>
			</div>
		</a>
	</li>

	<li class="_2txbrXXlXM">
		<a href="${path}/showAll.do" class="_2stzi1AtUa N=a:lst.product linkAnchor">
			<div class="FjO1Bk6iPK"></div>
			<div class="_2nYI9WkxU9">
				<div class="_2Tr9BUxNo4">
					<div class="_2JNWBGd-04 _3uKZ70Wwcp EnqpMc_sIs">
						<img class="_25CKxIKjAk" src="https://shop-phinf.pstatic.net/20220713_16/1657677236107Y5mdD_JPEG/58813019800970675_52083670.jpg?type=f232_232" alt="[상하목장] 얼려먹는 아이스크림 초코 85ml 24개입">
					</div>
				</div>
			</div>
			<strong class="_3E2b29u49p">[상하목장] 유기농 아이스크림 밀크 474mL 1개</strong>
			<div class="ZAfIG5c7RT">
				<strong><span class="_1mMufyjSsw">13,500</span>원</strong>
			</div>
		</a>
	</li>

	<li class="_2txbrXXlXM">
		<a href="${path}/showAll.do" class="_2stzi1AtUa N=a:lst.product linkAnchor">
			<div class="FjO1Bk6iPK"></div>
			<div class="_2nYI9WkxU9">
				<div class="_2Tr9BUxNo4">
					<div class="_2JNWBGd-04 _3uKZ70Wwcp EnqpMc_sIs">
						<img class="_25CKxIKjAk" src="https://shop-phinf.pstatic.net/20220812_125/16602634091009rUIe_JPEG/61399192807840645_1823459856.jpg?type=f232_232" alt="[상하목장] 얼려먹는 아이스주스 망고 85ml 24개입">
					</div>
				</div>
			</div>
			<strong class="_3E2b29u49p">[상하목장] 얼려먹는 아이스주스 망고 85ml 24개입</strong>
			<div class="ZAfIG5c7RT">
				<strong><span class="_1mMufyjSsw">26,400</span>원</strong>
			</div>
		</a>
	</li>

	<li class="_2txbrXXlXM">
		<a href="${path}/showAll.do" class="_2stzi1AtUa N=a:lst.product linkAnchor">
			<div class="FjO1Bk6iPK"></div>
			<div class="_2nYI9WkxU9">
				<div class="_2Tr9BUxNo4">
					<div class="_2JNWBGd-04 _3uKZ70Wwcp EnqpMc_sIs">
						<img class="_25CKxIKjAk" src="https://shop-phinf.pstatic.net/20220713_180/165767706433041zn8_JPEG/58812848017849825_754953056.jpg?type=f232_232" alt="[상하목장] 유기농아이스크림 딸기 100mL 4개">
					</div>
				</div>
			</div>
			<strong class="_3E2b29u49p">[상하목장] 유기농아이스크림 딸기 100mL 4개</strong>
			<div class="ZAfIG5c7RT">
				<strong><span class="_1mMufyjSsw">20,800</span>원</strong>
			</div>
		</a>
	</li>

	<li class="_2txbrXXlXM">
		<a href="${path}/showAll.do" class="_2stzi1AtUa N=a:lst.product linkAnchor">
			<div class="FjO1Bk6iPK"></div>
			<div class="_2nYI9WkxU9">
				<div class="_2Tr9BUxNo4">
					<div class="_2JNWBGd-04 _3uKZ70Wwcp EnqpMc_sIs">
						<img class="_25CKxIKjAk" src="https://shop-phinf.pstatic.net/20220713_198/1657677186977VPupb_JPEG/58812970682331120_1124354336.jpg?type=f232_232" alt="[상하목장] 유기농아이스크림 딸기 474mL 1개">
					</div>
				</div>
			</div>
			<strong class="_3E2b29u49p">[상하목장] 유기농아이스크림 딸기 474mL 1개</strong>
			<div class="ZAfIG5c7RT">
				<strong><span class="_1mMufyjSsw">13,500</span>원</strong>
			</div>
		</a>
	</li>
</ul>	
	<!-- 컨텐츠 종료 -->
	<!-- footer 시작 -->
	<%@ include file="footer.jsp" %>
	<!-- footer 끝 -->


</div>

</body>
</html>