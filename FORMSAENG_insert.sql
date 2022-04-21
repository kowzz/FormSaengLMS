--INSERT TABLE "DEPARTMENT";
--INSERT TABLE "MEMBER";
--INSERT TABLE "ASSIGNMENT_LIST";
--INSERT TABLE "NOTICE";
--INSERT TABLE "MESSAGE";
--INSERT TABLE "ACADEMIC_CALENDAR";
--INSERT TABLE "SUBJECT";
--INSERT TABLE "REFERENCE";
--INSERT TABLE "COMMENT";
--INSERT TABLE "WEEK_LECTURE";
--INSERT TABLE "REFERENCE_FILE";
--INSERT TABLE "ASSIGNMENT_FILE";
--INSERT TABLE "ENROLLMENT_STUDENT";
--INSERT TABLE "RECORD";


DROP TABLE "RECORD";
DROP TABLE "ENROLLMENT_STUDENT";
DROP TABLE "ASSIGNMENT_FILE";
DROP TABLE "REFERENCE_FILE";
DROP TABLE "WEEK_LECTURE";
DROP TABLE "COMMENT";
DROP TABLE "REFERENCE";
DROP TABLE "SUBJECT";
DROP TABLE "ACADEMIC_CALENDAR";
DROP TABLE "MESSAGE";
DROP TABLE "NOTICE";
DROP TABLE "ASSIGNMENT_LIST";
DROP TABLE "MEMBER";
DROP TABLE "DEPARTMENT";


--DROP SEQUENCE
DROP SEQUENCE SEQ_NOTICE_NO;
DROP SEQUENCE SEQ_ASG_NO;
DROP SEQUENCE SEQ_ASG_FILE_NO;
DROP SEQUENCE SEQ_COMMENT_NO;
DROP SEQUENCE SEQ_ACADEMIC_NO;
DROP SEQUENCE SEQ_MSG_NO;
DROP SEQUENCE SEQ_REC_NO;
DROP SEQUENCE SEQ_REFERENCE_NO;
DROP SEQUENCE SEQ_REF_FILE_NO;



CREATE TABLE "NOTICE" (
	"BOARD_NOTICE_NO"	NUMBER		NOT NULL,
	"BOARD_NOTICE_TITLE"	VARCHAR2(150)		NOT NULL,
    "BOARD_NOTICE_CONTENT"	VARCHAR2(2000)		NOT NULL,
	"BOARD_NOTICE_WRITER"	VARCHAR2(30)		NOT NULL,
	"BOARD_NOTICE_DATE"	TIMESTAMP	DEFAULT SYSTIMESTAMP	NOT NULL,
	"ID"	VARCHAR2(12)		NOT NULL
);

COMMENT ON COLUMN "NOTICE"."BOARD_NOTICE_NO" IS 'SEQ_NOTICE_NO';
COMMENT ON COLUMN "NOTICE"."ID" IS '학생:S 교수: P 관리자 :M';



CREATE TABLE "ASSIGNMENT_LIST" (
	"BOARD_ASSIGNMENT_NO"	NUMBER		NOT NULL,
	"BOARD_ASSIGNMENT_TITLE"	VARCHAR2(150)		NOT NULL,
	"BOARD_ASSIGNMENT_WRITER"	VARCHAR2(30)		NOT NULL,
	"BOARD_ASSIGNMENT_DATE"	TIMESTAMP	DEFAULT SYSTIMESTAMP	NOT NULL,
	"BOARD_ASSIGNMENT_CONTENT"	VARCHAR2(2000)		NOT NULL,
	"ID"	VARCHAR2(12)		NOT NULL
);

COMMENT ON COLUMN "ASSIGNMENT_LIST"."BOARD_ASSIGNMENT_NO" IS 'SEQ_ASG_NO';
COMMENT ON COLUMN "ASSIGNMENT_LIST"."ID" IS '학생:S 교수: P 관리자 :M';



CREATE TABLE "ASSIGNMENT_FILE" (
	"BOARD_FILE_NO"	NUMBER		NOT NULL,
	"BOARD_FILE_NAME"	VARCHAR2(300)		NOT NULL,
	"BOARD_FILE_PATH"	VARCHAR2(1000)		NOT NULL,
	"COMMENT_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "ASSIGNMENT_FILE"."BOARD_FILE_NO" IS 'SEQ_ASG_FILE_NO';



CREATE TABLE "ACADEMIC_CALENDAR" (
	"ACADEMIC_NO"	NUMBER		NOT NULL,
	"ACADEMIC_NAME"	VARCHAR2(60)		NOT NULL,
	"START_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"END_DATE"	DATE	DEFAULT SYSDATE	NOT NULL
);

COMMENT ON COLUMN "ACADEMIC_CALENDAR"."ACADEMIC_NO" IS 'SEQ_ACADEMIC_NO';



CREATE TABLE "SUBJECT" (
	"SUBJECT_CODE"	VARCHAR2(30)		NOT NULL,
	"SUBJECT_NAME"	VARCHAR2(30)		NOT NULL,
	"COURSE_GRADE"	NUMBER(1)		NOT NULL,
	"COURSE_SEMESTER"	NUMBER(4)		NOT NULL,
	"COURSE_CREDIT"	NUMBER(1)		NOT NULL,
	"COURSE_CLASS"	VARCHAR2(90)		NOT NULL,
	"COURSE_CAPACITY"	NUMBER		NOT NULL,
	"OPEN_YN"	VARCHAR2(3)		NOT NULL,
	"DEPT_CODE"	VARCHAR2(4)		NOT NULL,
	"CLASS_TYPE"	VARCHAR2(12)		NULL,
	"COURSE_DAY"	VARCHAR2(3)		NULL,
	"COURSE_PERIOD"	VARCHAR2(20)		NULL
);

COMMENT ON COLUMN "SUBJECT"."SUBJECT_CODE" IS 'ex) C001,C002,M001,M002';
COMMENT ON COLUMN "SUBJECT"."COURSE_SEMESTER" IS 'ex)2201,2202,2301,2302';
COMMENT ON COLUMN "SUBJECT"."DEPT_CODE" IS '컴공:C, 실음:M, 관리자:ADMIN';
COMMENT ON COLUMN "SUBJECT"."CLASS_TYPE" IS '전공선택/전공필수';



CREATE TABLE "DEPARTMENT" (
	"DEPT_CODE"	VARCHAR2(20)		NOT NULL,
	"DEPT_NAME"	VARCHAR2(20)		NOT NULL,
	"DEPT_OPACITY"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "DEPARTMENT"."DEPT_CODE" IS '컴공:C 실음:M 관리자 : ADMIN';



CREATE TABLE "REFERENCE" (
	"REF_NO"	NUMBER		NOT NULL,
	"REF_TITLE"	VARCHAR2(60)		NOT NULL,
	"REF_CONTENT"	VARCHAR2(900)		NOT NULL,
	"REF_WRITER"	VARCHAR2(30)		NOT NULL,
	"REF_WRITE_DATE"	TIMESTAMP	DEFAULT SYSTIMESTAMP	NOT NULL,
	"SUBJECT_CODE"	VARCHAR2(30)		NOT NULL
);

COMMENT ON COLUMN "REFERENCE"."REF_NO" IS 'SEQ_REF_NO';
COMMENT ON COLUMN "REFERENCE"."SUBJECT_CODE" IS 'ex) C001,C002,M001,M002';



CREATE TABLE "ENROLLMENT_STUDENT" (
	"ID"	VARCHAR2(12)		NOT NULL,
	"SUBJECT_CODE"	VARCHAR2(30)		NOT NULL
);

COMMENT ON COLUMN "ENROLLMENT_STUDENT"."ID" IS '학생:S , 교수:P, 관리자:M';
COMMENT ON COLUMN "ENROLLMENT_STUDENT"."SUBJECT_CODE" IS 'ex) C001,C002,M001,M002';



CREATE TABLE "REFERENCE_FILE" (
	"REF_FILE_NO"	NUMBER		NOT NULL,
	"REF_FILE_NAME"	VARCHAR2(90)		NOT NULL,
	"REF_FILE_PATH"	VARCHAR2(1000)		NOT NULL,
	"REF_NO"	NUMBER		NOT NULL
);



CREATE TABLE "MESSAGE" (
	"MSG_NO"	NUMBER		NOT NULL,
	"MSG_TITLE"	VARCHAR2(150)		NOT NULL,
	"MSG_CONTENT"	VARCHAR2(900)		NOT NULL,
	"MSG_DATE"	TIMESTAMP	DEFAULT SYSTIMESTAMP	NOT NULL,
	"RECEVIER"	VARCHAR2(30)		NOT NULL,
	"SENDER"	VARCHAR2(30)		NOT NULL
);

COMMENT ON COLUMN "MESSAGE"."MSG_NO" IS 'SEQ_MSG_NO';



CREATE TABLE "MEMBER" (
	"ID"	VARCHAR2(12)		NOT NULL,
	"NAME"	VARCHAR2(30)		NOT NULL,
	"PWD"	VARCHAR2(100)		NOT NULL,
	"RNUM"	VARCHAR2(20)		NOT NULL,
	"EMAIL"	VARCHAR2(300)		NOT NULL,
	"ADDRESS"	VARCHAR2(600)		NOT NULL,
	"DEPT_CODE"	VARCHAR2(20)		NOT NULL,
	"PNUM"	VARCHAR2(20)		NOT NULL
);

COMMENT ON COLUMN "MEMBER"."ID" IS '학생:S 교수: P 관리자 :M';
COMMENT ON COLUMN "MEMBER"."DEPT_CODE" IS '컴공:C 실음:M 관리자 : ADMIN';



CREATE TABLE "COMMENT" (
	"COMMENT_NO"	NUMBER		NOT NULL,
	"COMMENT_WRITER"	VARCHAR2(30)		NOT NULL,
	"COMMENT_DATE"	TIMESTAMP	DEFAULT SYSTIMESTAMP	NOT NULL,
	"COMMENT_CONTENT"	VARCHAR2(500)		NOT NULL,
	"ID"	VARCHAR2(12)		NOT NULL,
	"BOARD_ASSIGNMENT_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "COMMENT"."COMMENT_NO" IS 'SEQ_COMMENT_NO';
COMMENT ON COLUMN "COMMENT"."ID" IS '학생:S 교수: P 관리자 :M';



CREATE TABLE "WEEK_LECTURE" (
	"LECTURE_NO"	NUMBER		NOT NULL,
	"WEEK_NO"	NUMBER		NOT NULL,
	"VIDEO_TITLE"	VARCHAR2(100)		NOT NULL,
	"VIDEO_LINK"	VARCHAR2(900)		NOT NULL,
	"VIDEO_LENGTH"	NUMBER		NOT NULL,
	"UPLOAD_DATE"	TIMESTAMP	DEFAULT SYSTIMESTAMP	NOT NULL,
	"PERIOD"	TIMESTAMP		NOT NULL,
	"SUBJECT_CODE"	VARCHAR2(30)		NOT NULL
);

COMMENT ON COLUMN "WEEK_LECTURE"."LECTURE_NO" IS 'NVL(MAX(L_NO),0) +1';
COMMENT ON COLUMN "WEEK_LECTURE"."WEEK_NO" IS 'EX) 2201';
COMMENT ON COLUMN "WEEK_LECTURE"."VIDEO_LENGTH" IS '영상길이는 초로 변환';
COMMENT ON COLUMN "WEEK_LECTURE"."UPLOAD_DATE" IS 'D';
COMMENT ON COLUMN "WEEK_LECTURE"."PERIOD" IS '업로드날짜 + 7일';
COMMENT ON COLUMN "WEEK_LECTURE"."SUBJECT_CODE" IS 'ex) C001,C002,M001,M002';



CREATE TABLE "RECORD" (
	"REC_NO"	NUMBER		NOT NULL,
	"PLAYTIME"	NUMBER	DEFAULT 0	NOT NULL,
	"LECTURE_NO"	NUMBER		NOT NULL,
	"MID"	VARCHAR2(12)		NOT NULL
);

COMMENT ON COLUMN "RECORD"."REC_NO" IS '시퀀스';
COMMENT ON COLUMN "RECORD"."LECTURE_NO" IS 'NVL(MAX(L_NO),0) +1';



ALTER TABLE "NOTICE" ADD CONSTRAINT "PK_NOTICE" PRIMARY KEY (
	"BOARD_NOTICE_NO"
);

ALTER TABLE "ASSIGNMENT_LIST" ADD CONSTRAINT "PK_ASG_LIST" PRIMARY KEY (
	"BOARD_ASSIGNMENT_NO"
);

ALTER TABLE "ASSIGNMENT_FILE" ADD CONSTRAINT "PK_ASG_FILE" PRIMARY KEY (
	"BOARD_FILE_NO"
);

ALTER TABLE "ACADEMIC_CALENDAR" ADD CONSTRAINT "PK_ACADEMIC_CALENDAR" PRIMARY KEY (
	"ACADEMIC_NO"
);

ALTER TABLE "SUBJECT" ADD CONSTRAINT "PK_SUBJECT" PRIMARY KEY (
	"SUBJECT_CODE"
);

ALTER TABLE "DEPARTMENT" ADD CONSTRAINT "PK_DEPARTMENT" PRIMARY KEY (
	"DEPT_CODE"
);

ALTER TABLE "REFERENCE" ADD CONSTRAINT "PK_REFERENCE" PRIMARY KEY (
	"REF_NO"
);

ALTER TABLE "ENROLLMENT_STUDENT" ADD CONSTRAINT "PK_ENROLL_ST" PRIMARY KEY (
	"ID",
	"SUBJECT_CODE"
);

ALTER TABLE "REFERENCE_FILE" ADD CONSTRAINT "PK_REF_FILE" PRIMARY KEY (
	"REF_FILE_NO"
);

ALTER TABLE "MESSAGE" ADD CONSTRAINT "PK_MESSAGE" PRIMARY KEY (
	"MSG_NO"
);

ALTER TABLE "MEMBER" ADD CONSTRAINT "PK_MEMBER" PRIMARY KEY (
	"ID"
);

ALTER TABLE "COMMENT" ADD CONSTRAINT "PK_COMMENT" PRIMARY KEY (
	"COMMENT_NO"
);

ALTER TABLE "WEEK_LECTURE" ADD CONSTRAINT "PK_WEEK_LECTURE" PRIMARY KEY (
	"LECTURE_NO"
);

ALTER TABLE "RECORD" ADD CONSTRAINT "PK_RECORD" PRIMARY KEY (
	"REC_NO"
);

ALTER TABLE "NOTICE" ADD CONSTRAINT "FK_MEMBER_TO_NOTICE_1" FOREIGN KEY (
	"ID"
)
REFERENCES "MEMBER" (
	"ID"
);

ALTER TABLE "ASSIGNMENT_LIST" ADD CONSTRAINT "FK_MEMBER_TO_ASG_LIST_1" FOREIGN KEY (
	"ID"
)
REFERENCES "MEMBER" (
	"ID"
);

ALTER TABLE "ASSIGNMENT_FILE" ADD CONSTRAINT "FK_COMMENT_TO_ASG_FILE_1" FOREIGN KEY (
	"COMMENT_NO"
)
REFERENCES "COMMENT" (
	"COMMENT_NO"
);

ALTER TABLE "SUBJECT" ADD CONSTRAINT "FK_DEPT_TO_SUBJECT_1" FOREIGN KEY (
	"DEPT_CODE"
)
REFERENCES "DEPARTMENT" (
	"DEPT_CODE"
);

ALTER TABLE "REFERENCE" ADD CONSTRAINT "FK_SUBJECT_TO_REF_1" FOREIGN KEY (
	"SUBJECT_CODE"
)
REFERENCES "SUBJECT" (
	"SUBJECT_CODE"
);

ALTER TABLE "ENROLLMENT_STUDENT" ADD CONSTRAINT "FK_MEMBER_TO_ENROLL_ST_1" FOREIGN KEY (
	"ID"
)
REFERENCES "MEMBER" (
	"ID"
);

ALTER TABLE "ENROLLMENT_STUDENT" ADD CONSTRAINT "FK_SUBJECT_TO_ENROLL_ST_1" FOREIGN KEY (
	"SUBJECT_CODE"
)
REFERENCES "SUBJECT" (
	"SUBJECT_CODE"
);

ALTER TABLE "REFERENCE_FILE" ADD CONSTRAINT "FK_REF_TO_REF_FILE_1" FOREIGN KEY (
	"REF_NO"
)
REFERENCES "REFERENCE" (
	"REF_NO"
);

ALTER TABLE "MEMBER" ADD CONSTRAINT "FK_DEPT_TO_MEMBER_1" FOREIGN KEY (
	"DEPT_CODE"
)
REFERENCES "DEPARTMENT" (
	"DEPT_CODE"
);

ALTER TABLE "COMMENT" ADD CONSTRAINT "FK_MEMBER_TO_COMMENT_1" FOREIGN KEY (
	"ID"
)
REFERENCES "MEMBER" (
	"ID"
);

ALTER TABLE "COMMENT" ADD CONSTRAINT "FK_ASG_LIST_TO_COMMENT_1" FOREIGN KEY (
	"BOARD_ASSIGNMENT_NO"
)
REFERENCES "ASSIGNMENT_LIST" (
	"BOARD_ASSIGNMENT_NO"
);

ALTER TABLE "WEEK_LECTURE" ADD CONSTRAINT "FK_SUBJECT_TO_WEEK_LECTURE_1" FOREIGN KEY (
	"SUBJECT_CODE"
)
REFERENCES "SUBJECT" (
	"SUBJECT_CODE"
);

ALTER TABLE "RECORD" ADD CONSTRAINT "FK_WEEK_LECTURE_TO_RECORD_1" FOREIGN KEY (
	"LECTURE_NO"
)
REFERENCES "WEEK_LECTURE" (
	"LECTURE_NO"
);
--CREATE SEQUENCE
--NOTICE
CREATE SEQUENCE SEQ_NOTICE_NO
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE
;
--ASG_LIST
CREATE SEQUENCE SEQ_ASG_NO
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE
;
--COMMENT
CREATE SEQUENCE SEQ_COMMENT_NO
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE
;
--ASG_FILE
CREATE SEQUENCE SEQ_ASG_FILE_NO
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE
;
--ASG_FILE
CREATE SEQUENCE SEQ_ACADEMIC_NO
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE
;
--MESSAGE
CREATE SEQUENCE SEQ_MSG_NO
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE
;
--RECORD
CREATE SEQUENCE SEQ_REC_NO
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE
;
--REFERENCE
CREATE SEQUENCE SEQ_REFERENCE_NO
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE
;
--REFERENCE_FILE
CREATE SEQUENCE SEQ_REF_FILE_NO
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE
;


--TEST INSERT
--수강기간 계산법(timestamp)
--SELECT SYSTIMESTAMP + (INTERVAL '7' DAY) FROM DUAL; --수강기간 컬럼 입력용
--SELECT (TO_CHAR(ROUND(SYSTIMESTAMP + (INTERVAL '7' DAY)),'YY/MM/DD HH24:MI:SS')) FROM DUAL; - 사용자 화면 출력용



INSERT INTO DEPARTMENT VALUES ('C001','컴퓨터공학과',40);
INSERT INTO MEMBER VALUES ('S1111','아무개','0','960722-1111111','AAA@NAVER.COM','천안시 서북구','C001','010-1111-2222');
INSERT INTO SUBJECT VALUES('C0101','JAVA기초','1','2201','3','폼생관 202호','40','Y','C001','전공필수','월','1교시');

-- DEPARTMENT INSERT 부서코드 부서이름 정원 김혜린 2022-04-20
INSERT INTO DEPARTMENT VALUES ('M001','실용음악과',40);
INSERT INTO DEPARTMENT VALUES ('ADMIN','관리자',5);

-- Member INSERT 학번 이름 비번 주민번호 이메일 주소 학과코드 연락처 김혜린 2022-04-20
--학생 
INSERT INTO MEMBER VALUES ('S2022965229','박정환','0','960722-1111111','wjdghks5698@gmail.com','천안시 서북구','M001','010-1111-5229'); 
INSERT INTO MEMBER VALUES ('S2022954112','윤영원','0','950722-1111111','22youngwon@gmail.com','서울시 강동구','C001','010-2222-4112'); 
--교수 
INSERT INTO MEMBER VALUES ('P2022923210','홍샛별','0','920724-2222222','sbszhs@gmail.com','서울시 송파구','M001','010-3333-3210');
INSERT INTO MEMBER VALUES ('P2022958123','김혜린','0','951203-2222222','hhyrin03@gmail.com','경기도 고양시 일산동구','C001','010-4444-8123'); 
--관리자 김혜린 2022-04-21
INSERT INTO MEMBER VALUES ('M2022001550','오세현','0','000909-1111111','osh090909@gmail.com','경기도 의정부시','ADMIN','010-5555-1550'); 


-- 공지사항 값 입력시 INSERT 쿼리문
INSERT INTO NOTICE VALUES ((SEQ_NOTICE_NO.NEXTVAL), '테스트 공지사항 제목' ,'테스트 공지사항내용',(SELECT NAME FROM MEMBER WHERE NAME='아무개'), 
                    SYSTIMESTAMP, (SELECT ID FROM MEMBER WHERE ID = 'S1111'));

-- 과제 게시판 값 입력시 INSERT 쿼리문
INSERT INTO ASSIGNMENT_LIST VALUES ((SEQ_ASG_NO.NEXTVAL), '과제 게시판 제목', (SELECT NAME FROM MEMBER WHERE NAME='아무개'),
	SYSTIMESTAMP, '과제 게시판 내용', (SELECT ID FROM MEMBER WHERE ID = 'S1111'));

COMMIT;
