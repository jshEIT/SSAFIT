INSERT INTO user VALUES 
(1,'kimssafy','123','김싸피','김닉','kimssafy@email.com',1,now()),
(2,'leessafy','123','이싸피','이닉','leessafy@email.com',1,now()),
(3,'parkssafy','123','박싸피','박닉','parkssafy@email.com',1,now()),
(4,'choissafy','123','최싸피','최닉','choissafy@email.com',1,now()),
(5,'jeongssafy','123','정싸피','정닉','jeongssafy@email.com',1,now()),
(6,'kangssafy','123','강싸피','강닉','kangssafy@email.com',1,now()),
(7,'jossafy','123','조싸피','조닉','jossafy@email.com',1,now()),
(8,'yoonssafy','123','윤싸피','윤닉','yoonssafy@email.com',1,now()),
(9,'jangssafy','123','장싸피','장닉','jangssafy@email.com',1,now()),
(10,'limssafy','123','임싸피','임닉','limssafy@email.com',1,now()),
(11,'ssafy','1234','관리자','관리자','ssafy@ssafy.com',2,now());
commit;

INSERT INTO board VALUES
(1,"자유게시판","자유게시판",now()),
(2,"공지사항","공지사항",now());
commit;

INSERT INTO article (article_id,title,content,board_id,user_seq,created_at)
VALUES 
(1,"안녕하세요","반갑습니다",1,1,now()),
(2,"안녕하세요2","반갑습니다2",1,1,now()),
(3,"안녕하세요3","반갑습니다3",1,1,now()),
(4,"공지사항","공지사항",2,1,now());
commit;

INSERT INTO comment (comment_id,content,user_seq,article_id,board_id,created_at)
VALUES
(1,"댓글1",2,1,1,now()),
(2,"댓글2",2,1,1,now()),
(3,"댓글3",2,1,1,now()),
(4,"댓글4",2,4,2,now());
commit;

-- 등운동
INSERT INTO video (video_id, title, channel_title, description, part) 
VALUES 
("SVtdA4MZjBY","넓게 펼쳐지는 등을 만드는 등 상부 운동 5가지 (feat.크리스 범스테드)","운동하는 벌크맨","크리스 범스테드의 가장 큰 장점은 큰 키에도 불구하고 빈틈없이 균형적으로 발달한 클래식한 몸과 넓게 펼쳐지는 등근육인 듯합니다.","back"),
("osqzBgqZQz4","내가 남들보다 등 발전이 느렸던 이유 (남자 벌크업, 등운동 루틴! 랫풀다운/승모근/광배근)","보통사람을 위한 운동채널","3:00 등운동 효과 높혀주는 헬스 필수템! [악력보조-퀵그립]: https://bitly.ws/TtyP 1:25 집에서도 등근육 프레임을 넓혀주는 ...","back"),
("grhZV-mWxKY","바벨 위주로 하는 등 운동","김성환헬스유튜브","마이프로틴 https://bit.ly/2PKqObe [할인 코드 : Tomato 추천인 코드 : UGVZ-R1] 슈퍼비스트 보호대 ...","back"),
("wuyvlTWb3Jo","체형이 바뀌는 프로의 등운동은?","아모띠","아모띠 #보디빌딩 랭킹닭컴 아모띠 코드 https://bit.ly/470IrGV 위 링크 클릭 후 회원가입 버튼을 누르면 자동으로 제 아이디가 추천인 ...","back"),
("mi55EK35xfk","등 운동의 근본, 바벨로우 하는 방법 (진짜 한국에서 아무도 말해준 적 없는 정확한 근거와 이유)","파워게르만POGER","00:00 영상 시작 00:40 바벨로우 자세 기본 세팅법 00:46 시작 시 바벨의 높이 01:20 발의 간격 01:45 발의 각도 02:00 잡는 손의 너비 ...","back"),
("lImNglBwfLg","남자의 등빨(덩치)을 커지게 만드는 등운동의 핵심? (프레임 넓혀주는 상부 등근육 루틴! 광배근/승모근/대원근)","보통사람을 위한 운동채널","5:19 논문으로 증명 된, 당기는 운동 시 전완근 털리는걸 막아주는[악력보조-퀵그립] https://bitly.ws/TtyP 이번 영상에서 자문을 ...","back"),
("C6B5L62X_x4","내가 몰랐던 &#39;등 운동&#39; 관점 알아보기","김강민_Kim Kang min","0:00 0.운동 목적 0:42 1.데드리프트 04:35 2.DY로우 09:22 3.T바로우 10:35 4.시티드 로우 13:10 5.랫풀&풀오버 컴파운드 운동관련 ...","back"),
("mnBtJAx6H8Y","IFBB 프로에게 배우는 등 운동의 정석!_헬쓰 헬쓰","매미킴 TV","[구독]-[좋아요]는 큰! 큰! 힘이 됩니다   김동현 이메일:memikim88@gmail.com 김동현 인스타그램 ...","back"),
("_fw1kWGNHYU","등 운동 FULL 루틴(ft.김성환)","봉TV","최봉석 #봉TV #올림피아 #IFBBPRO #피지크 #봉시리얼 #김성환 #등운동 댓글로 운동&식단 관련된 궁금한 점 남겨주시면 영상으로 ...","back"),
("RVxf5MvkFo4","프로들의 &#39;등 운동&#39; 파헤치기","김강민_Kim Kang min","0:13 ~ 4:12 풀오버 머신 4:12 ~ 6:18 와이드풀다운 6:18 ~ 10:58 하이로우 10:58 ~ 14:31 티바로우 14:31 ~17:20 DY로우 분석영상 ...","back")
;
commit;

-- 가슴운동
INSERT INTO video (video_id, title, channel_title, description, part) 
VALUES 
("OuLzqmMg5bE","더 큰 가슴을 위한 완벽한 가슴운동 루틴 5가지 (+주요 꿀팁)","준규빌더","더 크고 단단한 가슴을 만들기위한 가슴운동 루틴 주요 꿀팁들 (운동전 식단 / 보충제 / 스트레칭 / 루틴꿀팁 등) 많이 포함 되어있으니 ...","chest"),
("4i9v30ahpQw","가슴운동할 때 어깨 안아프게 하는 방법","마사딕","가슴운동할 때 어깨 아픈 사람 팔꿈치 신경쓰세요!","chest"),
("JSCfbi8mQxM","초중급자를위한 가슴운동루틴!","김명섭의 헬스교실","가슴운동#운동루틴#김명섭의헬스교실 김명섭관장님이 열정을 다해 출간한 책에 여러분들의 많은 관심과 이용을 바랍니다 책구매 ...","chest"),
("3bxRDUs5hL0","가슴운동 6가지 | 프리웨이트 루틴","코리안헤라클레스 이용승","보디빌더 #가슴운동 #루틴 비즈니스 문의 khercules.ad@gmail.com 꾸준한근성장 ➙ 랭킹닭컴 : https://bit.ly/3fX9HfM 신선 ...","chest"),
("O0zunp1xkYs","필승 가슴운동 루틴","상체충 좌용관","필승 가슴운동 루틴","chest"),
("oRsJxOGz9_k","가슴운동 이렇게 했더니 드디어 10년만에 좋아지고 있습니다.","총총TV SILVER GUN","가슴운동 #벤치프레스 #총총 가슴 운동 후 닥터유 프로틴으로 더 크고 풍만한 대흉근 얻으시길 바라겠습니다   ...","chest"),
("ySCSNVnAeFU","[가슴루틴] 윗가슴 부터 채우는 가슴운동 루틴 순서/셋트/무게","핏블리 FITVELY","이대로 따라해보시면 바로 웅장해지는 가슴  을 느낄 수 있을 거예요     인클라인 벤치프레스 5set 15-10reps 플랫벤치프레스 ...","chest"),
("FlayZyv9EaA","감탄하면서 배운 가슴운동","말왕TV","[촬영협조] '보디빌더 김승민' https://www.youtube.com/@user-kb8st1lo4s '엠스타일짐' 인천 연수구 청능대로 75, 6층 엠스타일짐 ...","chest"),
("eswo1M6W9Kc","대보식 가슴 운동","김성환헬스유튜브","마이프로틴 https://bit.ly/2PKqObe [할인 코드 : Tomato 추천인 코드 : UGVZ-R1] 슈퍼비스트 보호대 ...","chest"),
("xs9hhAQYbj8","조회수 1150만회!? 가슴근육 &#39;가장 빠르게&#39;키우는 숨겨진 운동법!?","보통사람을 위한 운동채널","아래는 다양한 프레스 운동할 때 손목이 꺾임을 방지하고 단단하게 지지해주는 손목보호대 정보입니다. 참고가 되시길 바라겠습니다!","chest")
;
commit;

-- 어깨운동
INSERT INTO video (video_id, title, channel_title, description, part) 
VALUES 
("diA9R4BMII4","어깨운동 딱 3가지면 끝입니다.#어깨운동 #어깨루틴 #어깨깡패 #데스런 #데스런조성준 #shoulderworkout","DeSLun데스런","본영상은 https://www.youtube.com/watch?v=xo6mZjzQFT4 어깨운동,운동루틴,넓은어깨,어깨운동루틴,어깨,workoutroutain ...","shoulder"),
("XWs7Ut9nsnE","&#39;어깨운동&#39; 자가평가","김강민_Kim Kang min","추석에도 득근하시길 바랍니다 0:00 0.인트로 0:42 1.덤벨 프레스 5:01 2.사레레 8:40 3.업라이드 로우 10:27 4.벤트오버 레터럴 ...","shoulder"),
("EiN8tQAarRc","[리얼타임] 어깨 통증 사라지는 초간단 운동법 - 리프레쉬 어깨 운동 | 귀하신 몸 - 22화 삶을 짓누르는 어깨 통증 #귀하신몸 #귀하신몸운동법","EBS","어깨 통증 이제 안녕! 귀하신 2주 리프레쉬 어깨 운동법을 소개합니다! 리얼타임 영상으로 보고 따라해 보세요~ 귀하신 몸 - 삶을 짓 ...","shoulder"),
("F60RVDh7iis","100명 중 99명은 제대로 하고 있지 못한 어깨운동 조남은의 어깨운동 방법 꿀팁 대방출!","피지컬프로 Physical Pro","보디빌더 #어깨운동 #덤벨 #숄더프레스 안녕 헬세포들! 오늘은 덤벨 숄더프레스 꿀팁간다!! 어깨운동 가보즈아!!!! #피지컬프로 ...","shoulder"),
("lRJ2zcvtOXs","어깨 통증에 돈 그만 쓰세요. 1000만 원 써도 안 나았던 어깨 통증, 이것 하나로 싹 치료됐습니다. 어깨 통증, 오십견 운동만으로 해결하는 법│귀하신 몸│#골라듄다큐","EBSDocumentary (EBS 다큐)","이 영상은 2023년 10월 14일에 방송된 ＜귀하신 몸- 제22화 삶을 짓누르는 어깨 통증＞의 일부입니다. 최근 고령화, 스포츠/레저 활동 ...","shoulder"),
("m3UP53yzc0g","최신 근활성도 기계로 알아보는 가장 효율적인 어깨운동루틴","운동 루틴 가이드","아래 제품들은 제가 사용해보고 만족하여 직접 업체에 컨택한 제품들 입니다 ✓ 안정적인 무게증량과 어깨운동을 위한 [요즘 대세 ...","shoulder"),
("URVOrAxBDq0","[ENG] 🏅요일별운동🏅 금요일 형님 조직으로 돌아오십쇼.. 어깨/팔 운동","힙으뜸","으뜸챌린지 #여자어깨운동 #상체근력운동.","shoulder"),
("bLVdppb5d04","강력 추천하는 어깨 운동 루틴","건담포스 김건우","https://hity.io/95mD4rRE → 건담닭 조각구이 사러가기 Instagram @gundamforce ↪︎ https://www.instagram.com/gunda 문의 ...","shoulder"),
("dpFqSZ52jGk","승모근 안쓰는 💪직각어깨 만들기 10분 따라하기","제이제이살롱드핏","안녕하세요, 젤린이~여러분! 오늘은 많이들 요청 주셨던 쇼츠 운동 루틴 영상을 따라하기 버전으로 준비해봤어요! 이거 촬영하고 ...","shoulder"),
("2SE138IhBSI","어깨운동 딱 3가지만 하세요! (어깨뽕 만드는 운동 루틴)","헬창극장","3:27 '손목보호+중량상승!!'손목보호대-! [브렁크 리스트랩] : https://brunk.kr/27/?idx=132 (할인코드 [헬창] 입력시 +10% 할인) 형님들 ...","shoulder")
;
commit;

-- 복근운동
INSERT INTO video (video_id, title, channel_title, description, part) 
VALUES 
("PjGcOP-TQPE","11자복근 복부 최고의 운동 [복근 핵매운맛]","Thankyou BUBU","이번 영상을 찍기 전 저희가 했던 생각은 단순하고도 명확했습니다. '이번에는 정말 최고의 복근&복부운동 영상을 찍어보자...' 다른 ...","abs"),
("QSZ0mUGO_CA","[ENG] (층간소음X, 설명O) 🔥짧고 굵게🔥 복근만들기 2주 챌린지","힙으뜸","심으뜸복근운동 #클로이팅 #chloetingabs.","abs"),
("YNixmTmxt_g","[ENG] 휴가 준비 시작🌞 뱃살제거 + 납작배 만드는 20분 복근운동❗","힙으뜸","심으뜸 #복근운둥 #휴가.","abs"),
("zcQ16cfJN9Q","9분! 초간단 누워서하는 11자 복근운동","Thankyou BUBU","안녕하세요, Thankyou BUBU 입니다. 2015년 5월26일 '하루10분 복근만들기' 영상을 올린지도 벌써 2년하고도 6개월이 지났습니다.","abs"),
("kETh8T3it4k","[ENG] (층간소음X, 설명O) 복근운동과 유산소를 한번에❗️서서하는 복근운동 1탄🔥","힙으뜸","심으뜸복근운동 #코어운동 #통증없는복근운동.","abs"),
("PoYzxj8Iy5M","2주만에 복근 만드는 운동 2 MIN ABS WORKOUT","Thankyou BUBU","'복근 만드는 초간단 운동' 설명서   - 복근의 여러 부위(상복근/하복근/외복사근)를 다각도로 자극하는 루틴입니다. - 하루 2번 이상 ...","abs"),
("P81i-Umj6i8","르세라핌 카즈하가 실.제.로 하고있는 복근운동 루틴 10분 ( * 진짜 11자 복근이 단기간에 너무 예쁘게 만들어집니다 )","에이핏 afit","운동설명 지난 달리기 일주일 챌린지 영상에서 보여드렸던 카즈하님의 복근운동 영상을 드디어 올리게 되었네요!! 제목 그대로 실제로 ...","abs"),
("mFVKYIpcbNY","복근을 불러와주는 행운의 7분🍀 복근운동! | 7MIN LUCKY ABS WORKOUT in BALI","Allblanc TV","Allblanc Free Workout Program : https://bit.ly/allblancworkoutplan ▶️Join our Membership (private Live Workout) l 올블랑 맴버십 ...","abs"),
("d105ztp6ukQ","2일만에 뱃살이 빠진다고 소문났던 ‘르세라핌 카즈하 뱃살파괴운동’ (이번에 진짜 역대급임…💦)","비타민신지니 VitaminJINY","카즈하복근운동 #뱃살빼는운동 #르세라핌운동 #다이어트운동 #LESSERAFIMworkout 오늘은 약사가 만든 브랜드로 유명한 유어 ...","abs"),
("73oaPgayP8Q","[ENG] 🔥딱 5일!🔥 힙으뜸 11자 복근 만들기 챌린지","힙으뜸","심으뜸 #11자복근 #복근운동.","abs")
;
commit;

-- 팔운동
INSERT INTO video (video_id, title, channel_title, description, part) 
VALUES 
("T-bVqdhqW2U", "🔥출렁이는 팔뚝살🔥빨리 빼려면 1달만 이 루틴하세요. (팔뚝살빼는운동/팔뚝살 빨리 빼는법/팔뚝살 완전 제거 운동)", "비타민신지니 VitaminJINY", "팔뚝살 #팔뚝살빼는운동 #팔뚝살빨리빼는법 팔뚝살빼는운동 2탄 https://www.youtube.com/watch?v=l8KA8dgbUd0&t=155s ...", "arm"),
("u47s1pxeEZU", "팔운동을 하면 벌어지는 일!?", "보통사람을 위한 운동채널", "크고 강한 팔근육 만드는 꿀팁이 가득한 [풀영상] : https://www.youtube.com/watch?v=AfHZGfbePsE ▷ '보통사람'이 바로 따라할 수 ...", "arm"),
("vNmvIF5j0no", "두꺼운 팔을 위한 삼두 운동 딱 &#39;네 가지&#39; (크리스 범스테드 팔 운동 루틴 #1 | 이런걸 알고 해야 두꺼워집니다)", "알고하는 헬스", "팔 두꺼워지는 운동 찾고 계시죠? 크리스 범스테드는 무슨 팔운동을 어떻게 해서 팔이 두꺼워졌을까요? 오늘은 크리스 범스테드의 팔 ...", "arm"),
("lT73W459_KM", "팔 두꺼워지는 운동? 그런 거 있습니다. 팔근육 이두/삼두 세분화 방법 feat.김강민", "핏블리 FITVELY", "보디빌더 김강민 선수의 두꺼운 팔 만드는 운동을 배워봤습니다 팔은 생각보다 잘 커지는 근육이기 때문에, 이두와 삼두를 세분화 하여 ...", "arm"),
("N1ZpbAWvRpw", "💪🏻정말 안빠지는 두툼한 팔뚝살 🔥1달만에 -7cm 없애는🔥 효과 보장 루틴 ( * 하루에 딱 8분만 투자하세요 )", "에이핏 afit", "이 영상은 유료광고가 없습니다 ❌ 오늘 운동은 난이도가 그렇게 많이 높지 않기 때문에 하루 중 아무때나 해주셔도 정말 괜찮은 운동 ...", "arm"),
("JsF2nzetLBU", "👑조회수 ‘8,000,000’ 찍은👑전설의 팔뚝살빼는운동 7분 리뉴얼 버전", "비타민신지니 VitaminJINY", "팔뚝살빼는운동 #팔뚝살완전제거운동 #tonedarmsworkout ...", "arm"),
("7FtObDQ1D-U", "팔이 안 커지는 5가지 이유 [feat. 팔 운동 루틴]", "세계적으로 유명한 운동 정보", "이두 #삼두 #팔운동루틴 이번 영상은 팔 운동에 진심인 제프형이 새롭게 설계한 팔 운동 루틴을 알아보겠습니다! [참고자료] -5 Steps ...", "arm"),
("KQwYFHWCHco", "짧고 굵게⚠️ 5분만에 탄탄한 팔근육 만드는 운동 (NO쉬는시간)", "에일린 mind yoga", "짧굵 시리즈 1탄, 팔운동편. NO BREAK! 5분동안 빠르게 달리는   여자 팔근육 만들기 루틴이에요. 출렁이는 팔뚝살은 모두 제거하는 ...", "arm"),
("KaWNR0Rzydg", "1번만 따라해도 ‘팔뚝살’이 금방 얇아지는 ‘역대급 팔뚝살 돌려깎기’ (급속버전🔥)", "비타민신지니 VitaminJINY", "팔뚝살빼는운동 #팔뚝살빼기 #팔뚝살 ✓이쁜 민소매를 입고 싶은데 팔뚝이 두꺼워서 라인이 안이쁘다거나! ✓아무리 운동해도 팔뚝 ...", "arm"),
("qkQdIMW1xlw", "Lv.2 꽉! 차는 머슬핏 만드는 팔 루틴 (이두,삼두) 덤벨필요", "권혁TV", "권혁이 직접 짜준 식단*권혁이 직접 짜준 식단 및 운동루틴* https://hulktv.imweb.me/. * 닭가슴살 최저가 미트리 ...", "arm")
;
commit;

-- 하체운동
INSERT INTO video (video_id, title, channel_title, description, part) 
VALUES 
("js8z5wIZ0wg","[ENG] (층간소음X, 설명O) 진짜 힘듦주의.. 🔥초강력🔥 힙으뜸 하체운동 2주 챌린지","힙으뜸","심으뜸하체운동 #마일리사이러스다리운동 #하체근력운동.","leg"),
("DWYDL-WxF1U","하체 날, 딱 10분 밖에 없다면 - 스쿼트 10가지 동작 - 하체운동 홈트 루틴","빅씨스 Bigsis","하체운동 하는 날인데 시간이 딱 10분만 난다면 스쿼트를 해줘야죠!! 저와 스쿼트 10분 함께 해봅시다~       하체운동 난이도를 ...","leg"),
("pDFuLG0xrsU","🏅요일별운동🏅 금요일 하체집중 근력운동 15분 루틴!","힙으뜸","심으뜸하체운동 #하체근력운동 #하체비만운동.","leg"),
("seeFFgbCVvA","운동할 때 무릎 아픈분들 다 모여라 - 힙힌지 훈련 + 관절무리 없는 하체운동 홈트","빅씨스 Bigsis","멤버십 가입 (응원 감사합니다!) https://tinyurl.com/2p82daxr 하체 운동할 때마다 무릎 통증 있는 분들을 위한 하체운동 홈트 입니다.","leg"),
("2JCtM21W6Yw","대회 준비 하체 운동... (Feat. 마선호, 최한진)","김종국 GYM JONG KOOK","저와 늘 함께했던 최한진 선수가 시합을 앞두고 한창 몸을 만드는 중인대 저 혼자 보기가 너무 아까워서 유독 하체가 좋은 한진이와 ...","leg"),
("9_AiWMlH87U","하체운동 딱&#39;3가지&#39;만 하면 허벅지 쫙쫙 갈라집니다!!! (하체 필수 운동루틴)","헬린이 탈출을 위한 운동정보","하체 운동 시 무릎 안정성을 보조해주는 니슬리브 링크입니다. *[무릎 부상방지] 니슬리브 무릎 보호대 : https://c11.kr/1d1so 여러분들 ...","leg"),
("6NxJc_PwPOc","[하체] 하체 운동 딱 &#39;6가지&#39; 방법으로 허벅지 찢어버릴 수 있습니다!! (크리스 범스테드, 하니 램보드가 알려주는 하체 운동 루틴)","알고하는 헬스","하체 운동 알고 하시는 것 맞죠? 사실 프로 선수들과 여러분이 하는 하체 운동은 거기서 거기입니다. 그런데 왜 이렇게 차이가 나는 ...","leg"),
("dpBYYEhdofI","앞벅지 볼록, 뒷벅지 셀룰라이트, 허벅지 안쪽살 모조리 불태우고🔥 [여리탄탄 일자 허벅지] 되는 7일 루틴","이지은 다이어트 Jiny diet","허벅지 돌려깎기 / 이지은 다이어트가 입고 있는 '부종ZERO 순환레깅스' 구경하기 [https://www.mwooyang.com/leggins/?idx=13] ...","leg"),
("hrXfOwoEwSI","탄탄한 하체 만드는 필수 하체운동 5가지","준규빌더","탄탄한 하체를 만들기 위해 꼭 해야하는 하체운동 5가지 제가 즐겨하고 좋아하는 필수 다리 루틴만 뽑아서 구성해봤습니다 ㅡㅡㅡ ...","leg"),
("WWL58AYqlI8","최고의 하체운동 루틴","건담포스 김건우","건담닭 구매 링크 https://hity.io/gundamforce Instargram @gundamforce ↪︎ https://www.instagram.com/gundamforce/ 문의 ...","leg")
;
commit;

-- 팔로우 더미 데이터
INSERT INTO follow (from_user_seq,to_user_seq)
VALUES
(1,2),
(1,3),
(2,3),
(2,4),
(2,6),
(2,8);
commit;

-- 비디오 좋아요 더미 데이터
INSERT INTO video_like (video_id, user_seq)
VALUES
("OuLzqmMg5bE",1),
("4i9v30ahpQw",1);
commit;

-- 비디오 댓글 더미 데이터
INSERT INTO video_comment (content,user_seq,video_id)
VALUES
("히히 댓글 합체 발사",1,"OuLzqmMg5bE"),
("헤헤 댓글 합체 발사 222",1,"4i9v30ahpQw");
commit;