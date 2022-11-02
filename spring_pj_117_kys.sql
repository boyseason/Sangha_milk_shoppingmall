-- 스프링 시큐리티  
DROP TABLE mvc_customer_tbl CASCADE constraints;

CREATE TABLE mvc_customer_tbl(
    id        VARCHAR2(20) PRIMARY KEY,
    password  VARCHAR2(100) NOT NULL,  -- 암호화된 비밀번호를 저장해야 하므로 사이즈 크게 
    name      VARCHAR2(20) NOT NULL,   
    birthday  DATE         NOT NULL,
    address   VARCHAR2(50) NOT NULL,
    phone        VARCHAR2(13),
    email     VARCHAR2(50) NOT NULL,
    regDate  TIMESTAMP DEFAULT sysdate,   -- 가입일
    -- 시큐리티를 위한 추가
    key      VARCHAR2(100), -- 회원가입시 이메일 key 추가
    authority VARCHAR2(30) DEFAULT 'ROLE_USER', -- 권한 : ROLE_USER:customer, ROLE_ADMIN:관리자
    enabled   CHAR(1)    DEFAULT 0    -- 계정사용 가능여부(1:사용가능, 0:사용불가) : 이메일인증시 1로 update
);
	
ALTER TABLE mvc_customer_tbl
ADD enabled   CHAR(1)    DEFAULT 0;

SELECT * FROM MVC_CUSTOMER_TBL;

select PASSWORD from mvc_customer_tbl where id='test';

SELECT * FROM 
   		(SELECT A.*, rownum AS rn 
   			FROM (SELECT id, password, name, birthday, address, phone, email, regdate 
   					FROM mvc_customer_tbl 
					ORDER BY id) A)							
		WHERE rn >= 1 AND rn <= 5;

DELETE FROM MVC_CUSTOMER_TBL WHERE id = 'iu';

INSERT INTO mvc_customer_tbl(id, PASSWORD, NAME, BIRTHDAY, ADDRESS, PHONE, EMAIL, REGDATE, KEY)
VALUES ('hong','1234', '홍길동', '1980/01/01', '서울시 강남구', '010-1111-2222', 'hong@naver.com', sysdate, 'hong@naver.com');
INSERT INTO mvc_customer_tbl(id, PASSWORD, NAME, BIRTHDAY, ADDRESS, PHONE, EMAIL, REGDATE, KEY)
VALUES ('iu','1234', '아이유', '1994/01/01', '서울시 강서구', '010-1111-2222', 'iu@naver.com', sysdate, 'iu@naver.com');
INSERT INTO mvc_customer_tbl(id, PASSWORD, NAME, BIRTHDAY, ADDRESS, PHONE, EMAIL, REGDATE, KEY)
VALUES ('admin','admin', '관리자', '1999/01/01', '서울시 강북구', '010-1111-2222', 'admin@naver.com', sysdate, 'admin@naver.com');

UPDATE mvc_customer_tbl SET authority='ROLE_ADMIN' WHERE id='admin'; 

UPDATE mvc_customer_tbl SET ENABLED = 1 WHERE id='iu';

SELECT * FROM MVC_BOARD_TBL ORDER BY num desc;

-- boardList
DROP TABLE mvc_board_tbl CASCADE CONSTRAINT;

SELECT * FROM mvc_board_tbl;

CREATE TABLE mvc_board_tbl(
	num			number(7) 		PRIMARY KEY,
	title 		varchar2(50) 	NOT NULL,
	content		clob 			NOT NULL, -- 글내용 
	writer		varchar2(20) 	NOT NULL,
	password	varchar2(20) 	NOT NULL, -- 게시글 비밀번호
	readCnt		number(6) 		DEFAULT 0, -- 조회수
	regDate 	DATE			DEFAULT sysdate, -- 등록일
	comment_count NUMBER 		DEFAULT 0, -- 댓글 개수
	show 		varchar2(1)		DEFAULT 'y' -- 댓글 상태
);
-- CLOB : 대용량 텍스트 자료형 / BLOB : 대용량 바이너리 자료형 
-- 게시글에 따른 댓글 갯수 comment_count 추가
ALTER TABLE MVC_BOARD_TBL
	DROP column comment_count;

ALTER TABLE MVC_BOARD_TBL
	add comment_count NUMBER DEFAULT 0;

ALTER TABLE MVC_BOARD_TBL
	add show varchar2(1) DEFAULT 'y'

-- 게시글 목록 조회 (A의 모든 것을 가져오고 rownum(순번)을 옆에 붙이는데 1~5번째만 출력하겠다 : 1페이지)
SELECT * FROM 
(SELECT A.*, rownum AS rn FROM
	(SELECT * FROM mvc_board_tbl ORDER BY num desc) A)
	WHERE rn BETWEEN 1 AND 5;
-- WHERE rn BETWEEN ? AND ?; (start, end)

SELECT * FROM mvc_board_tbl ORDER BY num desc;
COMMIT;

DELETE FROM mvc_board_tbl WHERE num = 4; 

-- 게시글 목록(테스트 데이터)
DECLARE
	i NUMBER:= 1; -- 변수 i에 1을 대입하여 선언
BEGIN
	WHILE i <= 991 LOOP
		INSERT INTO mvc_board_tbl(num, title, content, writer, password, readCnt, regDate)
		VALUES (i, '글제목'||i, i||'번째 게시글내용', '작성자'||i, '1234', 0, sysdate);
		i := i+1;
	end LOOP;
END;
/


INSERT INTO mvc_board_tbl(num, title, content, writer, password, readCnt, regDate)
VALUES (1, 'test1', '첫 게시글 시작', '박하나',	 '1234', 0, sysdate);

SELECT * FROM mvc_board_tbl ORDER BY num desc;

SELECT count(*) FROM mvc_board_tbl; 

UPDATE mvc_board_tbl SET title='test30', CONTENT='서른번째 게시글 시작' WHERE num=30;

update mvc_board_tbl set readCnt=readCnt+1 WHERE num=1;

SELECT * FROM mvc_board_tbl where num=1 and password='1234';

INSERT INTO mvc_board_tbl(num, title, content, writer, password, readCnt, regDate)
VALUES((SELECT NVL(max(num)+1, 1) FROM mvc_board_tbl), 'test', '테스트 게시글 시작', '테스트',	'1234', 0, sysdate);

INSERT INTO mvc_board_tbl(num, title, content, writer, password, readCnt, regDate) 
VALUES((SELECT NVL(max(num)+1, 1) FROM mvc_board_tbl), '칼퇴근', '칼퇴', '화요일', '1234', 0, sysdate);

SELECT NVL(max(num)+1, 1) FROM mvc_board_tbl;

-- 댓글 테이블
DROP TABLE mvc_board_comment_tbl CASCADE CONSTRAINTS;

CREATE TABLE mvc_board_comment_tbl(
	comment_num NUMBER(7) 		PRIMARY KEY, -- pk 댓글 일련번호
	board_num	NUMBER(7) 		NOT NULL REFERENCES mvc_board_tbl(num), -- fk 게시글 번호
	writer 		varchar2(50) 	NOT NULL, -- 작성자
	content	 	clob  			NOT NULL, -- 내용
	reg_date 	DATE 			DEFAULT sysdate -- 작성일
);

SELECT * FROM MVC_BOARD_COMMENT_TBL; 

-- 댓글 추가
INSERT INTO mvc_board_comment_tbl(comment_num, board_num, writer, content, reg_date) 
VALUES((SELECT NVL(max(comment_num)+1, 1) FROM mvc_board_comment_tbl), 991, 'tester4', '오늘이 퇴근이라면', sysdate);

INSERT INTO mvc_board_comment_tbl(comment_num, board_num, writer, content, reg_Date)  
VALUES ((SELECT NVL(Max(comment_num)+1,1) FROM mvc_board_comment_tbl), 991, 'test913', 'countdown', sysdate)


SELECT * FROM mvc_board_comment_tbl WHERE BOARD_NUM = 991 ORDER BY COMMENT_NUM;


--------------------------------------------------------

-- kys 상품관리
DROP TABLE kys_product_tbl;

CREATE TABLE kys_product_tbl(
   pdNo       NUMBER        PRIMARY KEY, -- 상품코드
   pdName     varchar2(40)  NOT NULL UNIQUE, -- 상품명
   pdImg      varchar2(100) NOT NULL, -- 이미지가 아니라 경로가 들어간다
   category	  varchar2(50) 	NOT NULL,
   brand      varchar2(50)  NOT NULL, -- 브랜드
   content    clob,                -- 상품설명
   price      NUMBER        NOT NULL, -- 가격
   quantity   NUMBER        NOT NULL, -- 수량
   status     varchar2(20)  NOT NULL, -- 상태
   indate     DATE    		DEFAULT sysdate   -- 입고일
);

SELECT * FROM kys_product_tbl;

INSERT INTO kys_product_tbl(pdNo, pdName, pdImg, categoryNo, brand, content, price, quantity, status, indate)
values((SELECT NVL(Max(pdNo)+1,1) FROM kys_product_tbl), '유기농 딸기 1', '/jsp_pj_117_kys/resources/upload/아이스크림딸기1.jpg', '유기농 아이스크림', '상하목장', '유기농아이스크림 딸기 1', 13500, 100, '판매중', sysdate);

INSERT INTO kys_product_tbl(pdNo, pdName, pdImg, category, brand, content, price, quantity, status, indate)
values((SELECT NVL(Max(pdNo)+1,1) FROM kys_product_tbl), '유기농 밀크 1', '/jsp_pj_117_kys/resources/upload/아이스크림밀크1.jpg', '유기농 아이스크림', '상하목장', '유기농아이스크림 밀크 1', 13500, 100, '판매중', sysdate);

INSERT INTO kys_product_tbl(pdNo, pdName, pdImg, category, brand, content, price, quantity, status, indate)
values((SELECT NVL(Max(pdNo)+1,1) FROM kys_product_tbl), '유기농 딸기 1', '/jsp_pj_117_kys/resources/upload/아이스크림딸기1.jpg', '유기농 아이스크림', '상하목장', '유기농아이스크림 딸기 1', 13500, 100, '판매중', sysdate);


UPDATE kys_product_tbl SET pdimg='/jsp_pj_117_kys/resources/upload/아이스크림밀크1.jpg' WHERE pdno = 2;

UPDATE kys_product_tbl SET pdname='유기농 딸기 1' WHERE pdno = 1;

SELECT * FROM kys_product_tbl where category='유기농 아이스크림';


-- kys 고객
DROP TABLE kys_customer_tbl;

CREATE TABLE kys_customer_tbl(
	id			varchar2(20) PRIMARY KEY, -- 아이디 pk
	password	varchar2(20) NOT NULL, -- 비밀번호
	name		varchar2(20) NOT NULL, -- 이름
	birthday	DATE 		 NOT NULL, -- 생년월일
	address		varchar2(50) NOT NULL, -- 주소
	phone		varchar2(13), -- 010-1111-2222 '-' 포함 13자리
	email		varchar2(50) NOT NULL, -- 이메일
	regDate		timestamp 	 DEFAULT sysdate -- 가입일		 
);

INSERT INTO kys_customer_tbl(id, PASSWORD, NAME, BIRTHDAY, ADDRESS, PHONE, EMAIL, REGDATE)
VALUES ('hong','1234', '홍길동', '1980/01/01', '서울시 강남구', '010-1111-2222', 'hong@naver.com', sysdate);
INSERT INTO kys_customer_tbl(id, PASSWORD, NAME, BIRTHDAY, ADDRESS, PHONE, EMAIL, REGDATE)
VALUES ('iu','1234', '아이유', '1994/01/01', '서울시 강서구', '010-1111-2222', 'iu@naver.com', sysdate);
INSERT INTO kys_customer_tbl(id, PASSWORD, NAME, BIRTHDAY, ADDRESS, PHONE, EMAIL, REGDATE)
VALUES ('admin','admin', '관리자', '1999/01/01', '서울시 강북구', '010-1111-2222', 'admin@naver.com', sysdate);

delete FROM kys_customer_tbl WHERE id = 'hong';

SELECT * FROM kys_customer_tbl;


-- kys cart
DROP TABLE kys_cart_tbl CASCADE CONSTRAINTS;

CREATE TABLE kys_cart_tbl(
	cartNo	number 			PRIMARY KEY, -- 장바구니번호 pk
	id  	varchar2(20)	REFERENCES  kys_customer_tbl(id), -- 아이디(customer)
	pdNo 	number 			REFERENCES  kys_product_tbl(pdNo), -- 상품번호(product)
	cartCnt NUMBER 			NOT NULL, -- 장바구니 수량
	cartTotal NUMBER 		NOT NULL -- 총수량
);

SELECT * FROM kys_cart_tbl; 

INSERT INTO kys_cart_tbl(cartNo, id, pdNo, cartCnt, cartTotal)
VALUES ((SELECT NVL(Max(cartNo)+1,1) FROM kys_cart_tbl), 'hong', '1', 10, 20);
INSERT INTO kys_cart_tbl(cartNo, id, pdNo, cartCnt, cartTotal)
VALUES ((SELECT NVL(Max(cartNo)+1,1) FROM kys_cart_tbl), 'hong', '2', 10, 20);

SELECT * FROM kys_cart_tbl ca 
join kys_customer_tbl cu on ca.id=cu.id
join kys_product_tbl p on p.pdNo = ca.pdNo 
where cu.id='hong';

SELECT COUNT(*) as cnt FROM kys_cart_tbl where id='hong';

SELECT count(*) FROM kys_cart_tbl c, kys_product_tbl p WHERE p.pdNo=1 and c.id='hong'

DELETE FROM kys_cart_tbl WHERE id='hong';


-- kys order 주문목록
DROP TABLE kys_order_tbl CASCADE CONSTRAINTS;

CREATE table kys_order_tbl (        
    orderNo NUMBER PRIMARY KEY, -- 주문번호 pk
    id 		varchar2(20)  REFERENCES kys_customer_tbl(id), -- 아이디(customer) 
    pdNo 	NUMBER REFERENCES kys_product_tbl(pdNo), -- 상품번호(product)       
    orderCnt 	NUMBER NOT NULL, -- 주문 수량
    orderTotal NUMBER NOT NULL, -- 주문 총계
    orderDate DATE DEFAULT sysdate -- 주문일
);

SELECT * FROM kys_order_tbl ORDER BY orderNo desc;

SELECT COUNT(*) as cnt FROM kys_order_tbl;

SELECT * FROM kys_order_tbl o 
join kys_customer_tbl cu on o.id = cu.id
join kys_product_tbl p on p.pdNo = o.pdNo 
where cu.id='test';

-- 장바구니 > 주문목록 cartOrder 서브쿼리 
INSERT INTO kys_order_tbl(orderNo, id, pdNo, orderCnt, orderTotal)
values(
(SELECT NVL(Max(orderNo)+1,1) FROM kys_order_tbl), 
(SELECT id FROM kys_cart_tbl where cartNo=1),
(SELECT pdNo FROM kys_cart_tbl where cartNo=1),
(SELECT cartCnt FROM kys_cart_tbl where cartNo=1),
(SELECT cartTotal FROM kys_cart_tbl where cartNo=1));

DELETE FROM kys_order_tbl WHERE orderNo = 6;

-- kys buy 구매목록
DROP TABLE kys_buy_tbl CASCADE CONSTRAINTS;

CREATE table kys_buy_tbl (        
    buyNo NUMBER PRIMARY KEY, -- 구매번호 pk
    id 		varchar2(20)  REFERENCES kys_customer_tbl(id), -- 아이디(customer) 
    pdNo 	NUMBER REFERENCES kys_product_tbl(pdNo), -- 상품번호(product)       
    buyCnt 	NUMBER NOT NULL, -- 구매 수량
    buyTotal NUMBER NOT NULL, -- 구매 총계
    buyState varchar2(20) DEFAULT '주문요청', 	-- 구매 상태
    buyDate DATE DEFAULT sysdate -- 구매일
);

SELECT * FROM kys_buy_tbl ORDER BY buyNo desc; 

SELECT * FROM kys_buy_tbl b 
join kys_customer_tbl cu on b.id = cu.id
join kys_product_tbl p on p.pdNo = b.pdNo 
where cu.id='test'
ORDER BY buyNo DESC;

SELECT COUNT(*) as cnt FROM kys_buy_tbl where id='test';

-- 구매목록 추가 cartOrder 서브쿼리 
INSERT INTO kys_buy_tbl(buyNo, id, pdNo, buyCnt, buyTotal)
values(
(SELECT NVL(Max(buyNo)+1,1) FROM kys_buy_tbl), 
(SELECT id FROM kys_order_tbl where orderNo=3),
(SELECT pdNo FROM kys_order_tbl where orderNo=3),
(SELECT orderCnt FROM kys_order_tbl where orderNo=3),
(SELECT orderTotal FROM kys_order_tbl where orderNo=3));

DELETE FROM kys_buy_tbl WHERE buyNo=;

-- 결산 (select 날짜, 판매건수, 판매금액)
SELECT TO_DATE(b.BUYDATE, 'YY-MM-DD') AS soldDate
	, count(b.buyNo) AS soldCnt
	, sum(b.BUYTOTAL) AS soldTotal
FROM kys_buy_tbl b
WHERE b.BUYSTATE = '구매완료' OR b.BUYSTATE = '환불요청'
GROUP BY TO_DATE(b.BUYDATE, 'YY-MM-DD');

-- 결산 sold_view
DROP VIEW sold_view;

CREATE OR REPLACE VIEW sold_view
AS 
SELECT TO_DATE(b.BUYDATE, 'YY-MM-DD') AS soldDate
	, count(b.buyNo) AS soldCnt
	, sum(b.BUYTOTAL) AS soldTotal
	FROM kys_buy_tbl b
	WHERE b.BUYSTATE = '구매완료' OR b.BUYSTATE = '환불요청'
	GROUP BY TO_DATE(b.BUYDATE, 'YY-MM-DD');

SELECT * FROM sold_view;