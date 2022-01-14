<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="bean.BoardBean" %>    
    
<jsp:useBean id="bMgr" class="bean.BoardMgr" />

<%
	request.setCharacterEncoding("utf-8");
	int num = Integer.parseInt(request.getParameter("num"));
	
	bMgr.upCount(num);
	
	BoardBean bean = bMgr.getBoard(num);
	session.setAttribute("bean", bean);
%>    

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FreshMarket</title>
    <link rel="shortcut icon" href="images/shurt_icon.ico">
    <link rel="stylesheet" href="../css/login.css">
    <link rel="stylesheet" href="../css/read.css">
</head>
<body>
    <!-- 헤더 영역 시작-->
    <div id="page">
        <header>
            <!--Top Menu-->
            <div id="topMenu">
                <div class="topMenuArea">
                    <ul class="topMenuList1">
                        <li><a href="login.html">로그인</a></li>
                        <li><a href="join.html">회원가입</a></li>
                        <li class="topMenuList2"><a href="#">마이페이지</a>
                            <ul class="dropDown">
                                <li><a href="#">주문조회</a></li>
                                <li><a href="#">내정보수정</a></li>
                                <li><a href="#">찜 리스트</a></li>
                                <li><a href="#">1:1 문의</a></li>
                            </ul>
                        </li>
                        <li class="topMenuList2"><a href="#">고객센터</a>
                            <ul class="dropDown">
                                <li><a href="#">공지사항</a></li>
                                <li><a href="#">상품문의</a></li>
                                <li><a href="#">상품후기</a></li>
                                <li><a href="#">등업신청</a></li>
                            </ul>
                        </li>
                        <li><a href="#">장바구니</a></li>
                    </ul>
                </div>
            </div>
            <!--Top 메뉴 끝-->

            <!--제목, 검색창 영역 시작-->
            <div id="titleAndSearch">
                <div class="mainlogo">
                    <a href="index.html" class=""><img src="../images/freshMarket.PNG" alt="mainlogo" width="400px" alt="freshMarket"></a>
                </div>

                <div class="search">
                    <form action="search.jsp" method="get" id="searchForm" name="searchForm">
                        <fieldset>
                            <legend>검색 폼</legend>
                            <input type="search" id="keyword" name="keyword" placeholder="검색어를 입력하세요" required/> <!--search는 텍스트랑 비슷한데 옆에 x가 나와서 누르면 다 지워진다--> 
                            <button type="submit" class="searchBtn"><img src="../images/reading glasses.png" alt="search" width="23px"/></button>             
                        </fieldset>
                    </form>
                </div>

               
            </div>

            <!--제목, 검색창 영역 끝-->

            <!--메인 메뉴 영역 시작-->
            <nav id="mainMenu">
                <div class="mainMenuArea">
                    <h2 class="hidden">메인 메뉴</h2>
                    <ul>
                        <li class="allCategory"><a href="#">전체 카테고리</a>
                            <ul class="category1">
                                <li class="category2"><a href="#">과실류</a>
                                    <ul class="smallMenu">
                                        <li><a href="">과일</a></li>
                                        <li><a href="">냉동/건과일</a></li>
                                        <li><a href="">견과류</a></li>
                                    </ul>
                                </li>
                                <li class="category2"><a href="#">채소류</a>
                                    <ul class="smallMenu">
                                        <li><a href="">뿌리채소</a></li>
                                        <li><a href="">열매채소</a></li>
                                        <li><a href="">앞줄기채소</a></li>
                                        <li><a href="">버섯/나물류</a></li>
                                    </ul>
                                </li>
                                <li class="category2"><a href="#">축산</a>
                                    <ul class="smallMenu">
                                        <li><a href="">닭고기/계란</a></li>
                                        <li><a href="">돼지고기</a></li>
                                        <li><a href="">소고기</a></li>
                                        <li><a href="">기타 축산물</a></li>
                                    </ul>
                                </li>
                                <li class="category2"><a href="#">수산</a>
                                    <ul class="smallMenu">
                                        <li><a href="">생선</a></li>
                                        <li><a href="">해산류/어패류</a></li>
                                        <li><a href="">건어물</a></li>
                                        <li><a href="">김/해조류</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                        <li><a href="#">신상품출시</a></li>
                        <li><a href="#">인기상품</a></li>
                        <li><a href="#">알뜰장보기</a></li>
                        <li><a href="#">라이브</a></li>
                        <li><a href="#">이벤트</a></li>
                    </ul>
                </div>
            </nav>
        </header>
        <!-- 헤더 영역 종료-->

        <!--글쓰기 영역 시작-->
        <div>
            <div class="read_border_top">
                <div id="read">
                    <h2 class="page_location">HOME > 공지사항</h2>
                    <div class="read_area">
                        <h1>글읽기</h1>
                        <table>
        <tr>
            <th>성 명</th>
            <td><%=bean.getName() %></td>
            <th>등록일자</th>
            <td><%=bean.getRegdate() %></td>
        </tr>
        <tr>
            <th>제 목</th>
            <td colspan="3"><%=bean.getSubject() %></td>
        </tr>
        <tr>
            <td colspan="4" style="padding: 20px 5px;">
                <%=bean.getContent() %>
            </td>
        </tr>
        <tr>
            <td colspan="4" style="text-align: right;">
                조회수 <%=bean.getCount() %>
            </td>
        </tr>
        <tr>
            <td colspan="4"><hr></td>
        </tr>
        <tr>
            <td class="buttons" colspan="4">
                <button type="button" onclick="location.href='list.jsp'">
                	리스트
                </button>&nbsp;&nbsp;
                <button type="button" onclick="location.href='update.jsp'">
                	수정
                </button>&nbsp;&nbsp;
                <button type="button" onclick="location.href='delete.jsp'">삭제</button>
            </td>
        </tr>
    </table>
                    </div>
                </div>
            </div>
        </div>
        <!--글쓰기 영역 끝-->
    
           
        <!--footerTop 영역 시작-->
        <div id="footerTop">
            <div class="footerTopArea">
                <div class="ServiceCenterArea">
                    <div class="ServiceCenter">
                        <h1>고객센터</h1>
                        <h2>1661-0000</h2>
                        <div class="consulting">
                            <h3>문자상담</h3> <h3>010-1234-5678</h3>
                            <h3 class="deadline1">AM 10:00 ~ PM 17:00</h3>
                            <h3 class="deadline1">토·일·공휴일 휴무</h3>
                        </div>
                        <div class="deadline2">
                            <h3>당일출고 마감:오후3시 이전 결제완료건</h3>
                        </div>
                    </div>
                    
                    <div class="ServiceCenterlink">
                        <button class="kakoBtn">
                            <img src="../images/kakao.png" alt="kakao"/>
                            <h3>프레시마켓</h3>
                        </button>
                        <button class="questionBtn">
                            <h3>1:1문의 게시판 </h3>
                        </button>
                        <button class="oftenQuestionBtn">
                            <h3>자주 묻는 질문</h3>
                        </button>
                    </div>
                    
                </div>
               
            
                <div class="accountArea">
                    <h1>입급계좌</h1>
                    <div class="nonghyup">
                        <img src="../images/Nonghyup.png" alt="Nonghyup"/>
                        <h1>111-0550-1111-12</h1>
                    </div>
                    <div class="shinhan">
                        <img src="../images/shinhan.png" alt="shinhan"/>
                        <h1>110-121-775-225</h1>
                    </div>
                    <h1 class="accountName">예금주: 신종학 프레시마켓</h1>
                    <button class="findBtn"><a href="#">입금자를 찾습니다.</a></button>
                </div>

                <div class="notice">
                    <h2>공지사항</h2>
                    
                    <table>            
                        <tr>
                            <td><a href="#">상품 교환/반품 배송지 변경 안내 (2021.05 부터)</a></td>
                            <td class="date">2021-4-27</td>
                        </tr>
                        <tr>
                            <td><a href="#">전국 택배 없는 날_ 추석 배송 안내 </a></td>
                            <td class="date">2021-8-27</td>
                        </tr>
                        <tr>
                            <td><a href="#">프레시 마켓 회원등급정책 안내입니다. </a></td>
                            <td class="date">2021-8-10</td>
                        </tr>
                        <tr>
                            <td><a href="#">개인정보보호방침 변경에 따른 공지사항 (2021.09 변경)</a></td>
                            <td class="date">2021-8-10</td>
                        </tr> 
                    </table>
                </div>
            </div>
        </div> 
        
        <footer id="footer">
            <div class="footerArea">
                <div>
                    <img src="../images/kcp.png" class="kcp" alt="kcp"/>
                    <a href="https://www.cjlogistics.com/" class="koreaExpress"><img src="../images/KoreaExpress.png" alt="KoreaExpress"/></a>
                    
                </div> 
                <section class="guideInfo">     
                <ul>
                    <li><b>프레시 마켓</b> 주소: 수원시 권선구 세류동 123-12 세류빌딩 5층</li>
                    <li>사업자등록번호: 031-234-5678</li>
                    <li>대표번호: 1661-0000</li>
                    <li class="email">E-MAIL : <a href="mailto:fresh123@freshMarket.com">fresh123@freshMarket.com</a></li>
                    <li>고객님은 안전거래를 위해 현금등으로 결제시 저희 쇼핑몰에서 가입한 PG사의 구매안전 서비스를 아용할 수 있습니다. </li>
                </ul>
                <p class="copyright">Copyright since &copy; freshMarket.co.kr all right reserved. </p> 
                </section>
                <section  class="guideLink">
                    <h2 class="hidden">사이트 이용안내</h2>
                    <div class="guide"><a href="#">회사소개</a></div>
                    <div class="guide"><a href="#">이용약관</a></div>
                    <div class="guide"><a href="#">광고제휴문의</a></div>
                    <div class="guide"><a href="#">쇼핑몰 이용안내</a></div>
                    <div class="guide"><a href="#">고객센터</a></div>
                    <div class="guide"><a href="#">개인정보취급방침</a></div>
                    <div class="home"><a href="index.html">HOME</a></div>
                    <div class="top"><a href="#">TOP</a></div>
                </section>
                               
            </div>
        </footer>    
            
          
        </div>
    </div>
</body>
</html>