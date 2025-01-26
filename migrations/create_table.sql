DROP TABLE IF EXISTS notices CASCADE;
DROP TABLE IF EXISTS companies CASCADE;
DROP TABLE IF EXISTS bids CASCADE;

CREATE TABLE notices (
    id SERIAL PRIMARY KEY,
    "공고번호" VARCHAR(50) UNIQUE NOT NULL,
   	"공고제목" TEXT NOT NULL,
    "발주처" TEXT NOT NULL,
    "지역제한" VARCHAR(50) NOT NULL,
    "기초금액" NUMERIC NOT NULL,
    "예정가격" NUMERIC NOT NULL,
    "예가범위" VARCHAR(50) NOT NULL,
    "A값" NUMERIC,
    "투찰률" NUMERIC NOT NULL,
    "참여업체수" INTEGER NOT NULL,
    "공고구분표시" VARCHAR(100),
    "정답사정률" NUMERIC NOT NULL
);

CREATE TABLE companies (
    id SERIAL PRIMARY KEY,
    "사업자번호" VARCHAR(20) UNIQUE NOT NULL,
    "업체명" VARCHAR(255) UNIQUE NOT NULL,
    "대표명" VARCHAR(10) NOT NULL
);

CREATE TABLE bids (
    id SERIAL PRIMARY KEY,
    notice_id INT REFERENCES notices(id),
    company_id INT REFERENCES companies(id),
    "투찰금액" BIGINT,
    "예가대비 투찰률" FLOAT NOT NULL,
	"기초대비 투찰률" FLOAT NOT NULL,
	"기초대비 사정률" FLOAT NOT NULL,
    "투찰일시" TIMESTAMP
);