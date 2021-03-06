class Api {
  Future<List<Category>> getCategories() async {
    return Future.delayed(
      const Duration(milliseconds: 100),
      () {
        return Category.allCategories;
      },
    );
    // return Future.value(Category.allCategories);
  }

  Map<String, List<String>> categories = {
    "클린": [
      "입주 청소",
      "이사 청소",
      "인테리어 청소",
      "거주 청소",
      "준공 청소",
      "정기 청소",
      "화재 청소",
      "쓰레기집 청소",
      '간판 청소',
      '외벽 청소',
      "학교/관공서 청소",
      "상가 청소",
      "주방후드 청소",
      "기타 청소",
    ],
    "인테리어": [
      "올 인테리어",
      "필름 인테리어",
      "탄성 코트",
      "도배",
      "장판/마루",
      "페인트",
      "방충망 교체",
      "욕실 인테리어",
      "타일 교체",
      "중문",
      "커튼/블라인드",
      "바닥 매트",
      "기타 인테리어"
    ],
    "홈 스타일링": [
      "줄눈",
      "실리콘 오염 방지",
      "욕실 나노 코팅",
      "상판 연마 코팅",
      "엔지니어스톤 코팅",
      "바닥 왁싱",
      "단열 차단 필름",
      "정리정돈",
      "새집 증후군",
      "곰팡이 제거",
      "기타 홈스타일링"
    ],
    "가전/가구 케어": [
      "조명 설치",
      "에어컨 이전 설치",
      "에어컨 분해 청소",
      "세탁기 분해 청소",
      "냉장고 청소",
      "맞춤 가구 제작",
      "붙박이장 설치",
      "시스템 행거",
      "펜트리 선반 설치",
      "매트리스 케어",
      "쇼파천갈이",
      "보일러 설치",
      "배관수리 및 청소",
      "기타 가전/가구"
    ],
    "렌탈": [
      "정수기 렌탈",
      "에어컨 렌탈",
      "비데 렌탈",
      "매트리스 렌탈",
      "쇼파 렌탈",
      "TV 렌탈",
      "안마의자 렌탈",
      "운동기구 렌탈",
      "의류 관리기 렌탈",
      "식기 세척기 렌탈",
      "음식물 분쇄기 렌탈",
      "청소기 렌탈",
      "공기 청정기 렌탈",
      "기타 렌탈"
    ],
    "기타": ["사전점검", "소독/방역", "기타 서비스"],
  };

  Map<String, String> categoryImages = {
    "입주 청소": "assets/c_1.jpg",
    "이사 청소": "assets/c_2.jpg",
    "인테리어 청소": "assets/c_3.jpg",
    "거주 청소": "assets/c_4.jpg",
    "준공 청소": "assets/c_5.jpg",
    "정기 청소": "assets/c_6.jpg",
    "화재 청소": "assets/c_7.jpg",
    "쓰레기집 청소": "assets/c_8.jpg",
    '간판 청소': "assets/c_9.jpg",
    '외벽 청소': "assets/c_10.jpg",
    "학교/관공서 청소": "assets/c_11.jpg",
    "상가 청소": "assets/building.jpg",
    "주방후드 청소": "assets/hood.jpg",
    "기타 청소": "assets/toilet.jpg",
    "올 인테리어": "assets/img1.jpg",
    "필름 인테리어": "assets/img2.jpg",
    "탄성 코트": "assets/img3.jpg",
    "도배": "assets/img4.jpg",
    "장판/마루": "assets/img5.jpg",
    "페인트": "assets/img6.jpg",
    "방충망 교체": "assets/img7.jpg",
    "욕실 인테리어": "assets/img8.jpg",
    "타일 교체": "assets/img9.jpg",
    "중문": "assets/img10.jpg",
    "커튼/블라인드": "assets/img11.jpg",
    "바닥 매트": "assets/mat.jpg",
    "기타 인테리어": "assets/img12.jpg",
    "줄눈": "assets/h_1.jpg",
    "실리콘 오염 방지": "assets/h_2.jpg",
    "욕실 나노 코팅": "assets/h_3.jpg",
    "상판 연마 코팅": "assets/h_4.jpg",
    "엔지니어스톤 코팅": "assets/h_5.jpg",
    "바닥 왁싱": "assets/h_6.jpg",
    "단열 차단 필름": "assets/h_7.jpg",
    "정리정돈": "assets/h_8.jpg",
    "새집 증후군": "assets/h_9.jpg",
    "곰팡이 제거": "assets/h_10.jpg",
    "기타 홈스타일링": "assets/kitchen.jpg",
    "조명 설치": "assets/g_1.jpg",
    "에어컨 이전 설치": "assets/g_2.jpg",
    "에어컨 분해 청소": "assets/g_3.jpg",
    "세탁기 분해 청소": "assets/g_4.jpg",
    "냉장고 청소": "assets/g_5.jpg",
    "맞춤 가구 제작": "assets/g_6.jpg",
    "붙박이장 설치": "assets/g_7.jpg",
    "시스템 행거": "assets/g_8.jpg",
    "펜트리 선반 설치": "assets/g_9.jpg",
    "매트리스 케어": "assets/g_10.jpg",
    "쇼파천갈이": "assets/g_11.jpg",
    "보일러 설치": "assets/heater.jpg",
    "배관수리 및 청소": "assets/plumbing.jpg",
    "기타 가전/가구": "assets/g_12.jpg",
    "정수기 렌탈": "assets/l_1.jpg",
    "에어컨 렌탈": "assets/l_2.jpg",
    "비데 렌탈": "assets/l_3.jpg",
    "매트리스 렌탈": "assets/l_4.jpg",
    "쇼파 렌탈": "assets/l_5.jpg",
    "TV 렌탈": "assets/l_6.jpg",
    "안마의자 렌탈": "assets/l_7.jpg",
    "운동기구 렌탈": "assets/l_8.jpg",
    "의류 관리기 렌탈": "assets/l_9.jpg",
    "식기 세척기 렌탈": "assets/l_10.jpg",
    "음식물 분쇄기 렌탈": "assets/l_11.jpg",
    "청소기 렌탈": "assets/l_12.jpg",
    "공기 청정기 렌탈": "assets/l_13.jpg",
    "기타 렌탈": "assets/rental.jpg",
    "사전점검": "assets/e_1.jpg",
    "소독/방역": "assets/e_2.jpg",
    "기타 서비스": "assets/etc.jpg",
  };

  String findMainCategory(String category) {
    if (category == "개인 문의") {
      return "";
    } else {
      if (category == "") {
        return "";
      } else {
        Iterable item = categories.keys
            .where((element) => categories[element]!.contains(category));
        return item.toList()[0];
      }
    }
  }

  String findCategoryImage(String category) {
    return categoryImages[category] ?? "";
  }
}

class Category {
  final String id;
  final String name;
  final String description;
  final List<CategorySub> sub;

  const Category(
      {required this.id,
      required this.name,
      required this.description,
      required this.sub});

  static const List<Category> allCategories = [
    Category(
        id: '0',
        name: '클린',
        description: "청결을 유지하고 쾌적한 환경을 만들기 위한 클린 서비스",
        sub: cleanList),
    Category(
        id: '1',
        name: '인테리어',
        description: "건축물의 구조 및 시설의 개/보수 및 변경 서비스",
        sub: interiorList),
    Category(
        id: '2',
        name: '홈 스타일링',
        description: "내부의 환경을 아름답거나 쾌적하게 꾸미고 관리하는 서비스",
        sub: homeList),
    Category(
        id: '3',
        name: '가전/가구 케어',
        description: "가전/가구의 정기 관리 또는 교체나 성능 유지를 위한 전문 케어 서비스",
        sub: careList),
    Category(
        id: '4', name: '렌탈', description: "필요한 제품을 렌탈하는 서비스", sub: rentalList),
    Category(
        id: '5',
        name: '기타',
        description: "그 외 홈케어 관련 문의 시 고객 맞춤형 서비스",
        sub: etcList),
  ];
}

const List<CategorySub> cleanList = [
  CategorySub(
      image: 'assets/c_1.jpg',
      title: '입주 청소',
      content: "아파트나 빌라 등 신축 건물 첫 입주로 공사시 발생한 분진이나 먼지등 공사 \n 흔적 제거를 위한 클린 서비스",
      category: '클린',
      image2: 'assets/c_2.jpg',
      title2: '이사 청소',
      content2: "이전 거주자의 생활 오염, 묵은때, 찌든때 등\n흔적을 제거하기 위한 클린 서비스",
      category2: '클린'),
  CategorySub(
      image: 'assets/c_3.jpg',
      title: '인테리어 청소',
      content: "인테리어 공사 흔적과 분진이나 \n 먼지 제거를 위한 클린 서비스",
      category: '클린',
      image2: 'assets/c_4.jpg',
      title2: '거주 청소',
      content2: "거주 중 생활 오명이나 묵은때, \n 찌든때 제거를 위한 클린 서비스",
      category2: '클린'),
  CategorySub(
      image: 'assets/c_5.jpg',
      title: '준공 청소',
      content: " 건물의 신축이나 증축 후 준공 허가를 받기 위한 인테리어 자재 정리 및 \n 폐기물 정리등의 1차 클린 서비스",
      category: '클린',
      image2: 'assets/c_6.jpg',
      title2: '정기 청소',
      content2: "사무실이나 공장, 상가 등 정기적으로 관리하는 클린 서비스",
      category2: '클린'),
  CategorySub(
      image: 'assets/c_7.jpg',
      title: '화재 청소',
      content: "화재로 인한 그으름 및 현장 정리 및 \n 클린 서비스",
      category: '클린',
      image2: 'assets/c_8.jpg',
      title2: '쓰레기집 청소',
      content2: "거주자의 과도한 쓰레기로 일반 청소 외 쓰레기 및 폐기물 정리 및 클린 서비스",
      category2: '클린'),
  CategorySub(
      image: 'assets/c_9.jpg',
      title: '간판 청소',
      content: "상가 및 사무실 간판의 이물 및 오염을 제거하는 클린 서비스",
      category: '클린',
      image2: 'assets/c_10.jpg',
      title2: '외벽 청소',
      content2: "건물 외벽의 이물 및 오염을 제거하는 클린 서비스",
      category2: '클린'),
  CategorySub(
      image: 'assets/c_11.jpg',
      title: '학교/관공서 청소',
      content: " 다중 이용 시설 오염 및 먼지 제거를 위한 대청소 클린 서비스",
      category: '클린',
      image2: 'assets/building.jpg',
      title2: '상가 청소',
      content2: "-",
      category2: '클린'),
  CategorySub(
      image: 'assets/hood.jpg',
      title: '주방후드 청소',
      content: "-",
      category: '클린',
      image2: 'assets/toilet.jpg',
      title2: '기타 청소',
      content2: "-",
      category2: '클린'),
];
const List<CategorySub> interiorList = [
  CategorySub(
      image: 'assets/img1.jpg',
      title: '올 인테리어',
      content: "가정이나 환경의 모든 환경을 \n 변경하는 서비스",
      category: '인테리어',
      image2: 'assets/img2.jpg',
      title2: '필름 인테리어',
      content2:
          "문이나 창틀등의 노후되고 벗겨진 면을 필름 시트지로 변경하여 깔끔하고 \n 세련된 인테리어 변경이 가능하고 \n 유지관리가 용이, 비용이 \n 경제적인 서비스",
      category2: '인테리어'),
  CategorySub(
      image: 'assets/img3.jpg',
      title: '탄성 코트',
      content:
          "수성 페인트의 단점을 보완한 고무의 \n 아크릴 성분의 특수도료 페인트로 \n 벽 곰팡이 제거와 단열에 효고적인 \n 서비스",
      category: '인테리어',
      image2: 'assets/img6.jpg',
      title2: '도배',
      content2: "종이 (실크종이, 합지 바염 등) 에 \n 질감과 색감을 입혀 벽이나 천장에 \n 바르는 서비스",
      category2: '인테리어'),
  CategorySub(
      image: 'assets/img4.jpg',
      title: '장판/마루',
      content: "가정이나 오피스의 바닥을 마무리하며 붙이는 서비스",
      category: '인테리어',
      image2: 'assets/img5.jpg',
      title2: '페인트',
      content2: "액상 또는 분말 형태의 벽면에 도장하여 겉모양 장식이나 바탕 보호,\n 특수한 기능을 가지게 하는 서비스",
      category2: '인테리어'),
  CategorySub(
      image: 'assets/img7.jpg',
      title: '방충망 교체',
      content:
          "공기의 흐름을 방해하지 않으며,\n 곤충이나 벌레의 출입을 막는\n 촘촘한 그물이며, 찢어지거나 노후로 인해 교체해 주는 서비스",
      category: '인테리어',
      image2: 'assets/img8.jpg',
      title2: '욕실 인테리어',
      content2: "기존 욕실의 노후나 망가짐으로 인해\n 욕실 바닥이나 세면대, 욕조, 변기 등을 교체하는 서비스",
      category2: '인테리어'),
  CategorySub(
      image: 'assets/img9.jpg',
      title: '타일 교체',
      content:
          "장판이나 마루 바닥외 현관이나 베란다 등의 바닥 마감제로 \n 변색이나 깨짐, 또는 시각적이나 편리성을 위한 타일 교체 서비스",
      category: '인테리어',
      image2: 'assets/img10.jpg',
      title2: '중문',
      content2:
          "주로 현관문앞에 내부의 온도 변화나 외부로 부터 유입되는 이물을 \n 막아주는 역할을 하는 문을 시공하는 서비스",
      category2: '인테리어'),
  CategorySub(
      image: 'assets/img11.jpg',
      title: '커튼/블라인드',
      content:
          "건물의 창이나 출입구에 설치라거나\n 칸막이로 사용되는 천으로 이루어진 \n 막이나 아크릴, 나무 등으로 분위기 연출이 가능한 설치 서비스",
      category: '인테리어',
      image2: 'assets/mat.jpg',
      title2: '바닥 매트',
      content2: "-",
      category2: '인테리어'),
  CategorySub(
      image: 'assets/img12.jpg',
      title: '기타 인테리어',
      content: "빌트인 등 기타 인테리어 서비스",
      category: '인테리어',
      image2: '',
      title2: '',
      content2: "",
      category2: ''),
];
const List<CategorySub> homeList = [
  CategorySub(
      image: 'assets/h_1.jpg',
      title: '줄눈',
      content:
          "타일과 타일 사이 백시멘의 변색이나 오염을 방지하게 위한 \n 코팅 시공으로 찌든때, 곰팡이 및 줄눈오염을 방지하는 코팅 서비스",
      category: '홈 스타일링',
      image2: 'assets/h_2.jpg',
      title2: '실리콘 오염 방지',
      content2: "인테리어 마감 소재인 실리콘의 오염이나 곰팡이 생성을 \n 방지하기 위한 코팅 서비스",
      category2: '홈 스타일링'),
  CategorySub(
      image: 'assets/h_3.jpg',
      title: '욕실 나노 코팅',
      content:
          "욕실의 세면대, 변기, 거울등의 물때\n 방지와 곰팡이등의 오명 방지하고\n 쾌적한 환경 관리를 위한 특수\n 약품 코팅 서비스 ",
      category: '홈 스타일링',
      image2: 'assets/h_4.jpg',
      title2: '상판 연마 코팅',
      content2:
          " 싱크대 또는 가구 등의 상판에 오염 및 스크래치등을 \n 제거하고 유지 관리 할수 있도록\n 특수 약품 코팅 서비스",
      category2: '홈 스타일링'),
  CategorySub(
      image: 'assets/h_5.jpg',
      title: '엔지니어스톤 코팅',
      content: " 천연석 ( 대리석 싱크대 등 ) 의 상판 연마 코팅 서비스",
      category: '홈 스타일링',
      image2: 'assets/h_6.jpg',
      title2: '바닥 왁싱',
      content2: "장판이나 마루의 오염 및 스크래치\n 발등을 예방하고 관리하기 위한\n 특수 약품 코팅 서비스",
      category2: '홈 스타일링'),
  CategorySub(
      image: 'assets/h_7.jpg',
      title: '단열 차단 필름',
      content: " 단열 및 유해광선 차단을 위해 특수\n 제조 된 필름지를 창에 시공하는\n 서비스",
      category: '홈 스타일링',
      image2: 'assets/h_8.jpg',
      title2: '정리정돈',
      content2: " 불필요한 물건을 정리하고 품목이나\n 사용 빈도 별로 구하여 고객의\n 편리를 극대화 하는 서비스",
      category2: '홈 스타일링'),
  CategorySub(
      image: 'assets/h_9.jpg',
      title: '새집 증후군',
      content: " 내부에 생성된 유해물질 또는\n 오염물질을 친환경소재를 사용하거나 환기등을\n 통해 제거하여 주는 서비스",
      category: '홈 스타일링',
      image2: 'assets/h_10.jpg',
      title2: '곰팡이 제거',
      content2:
          "바깥과 닿는 벽 ( 베란다 / 세탁실 등) 환기가 어려운 수납장 등에 습기로\n 인해 발생한 곰팡이를 제거하는 서비스",
      category2: '홈 스타일링'),
  CategorySub(
      image: 'assets/kitchen.jpg',
      title: '기타 홈스타일링',
      content: "-",
      category: '홈 스타일링',
      image2: '',
      title2: '',
      content2: "",
      category2: ''),
];
const List<CategorySub> careList = [
  CategorySub(
      image: 'assets/g_1.jpg',
      title: '조명 설치',
      content: "노후 된 조명 및 LED 전등 교체와 같은 조명 교체 & 설치 서비스",
      category: '가전/가구 케어',
      image2: 'assets/g_2.jpg',
      title2: '에어컨 이전 설치',
      content2: "이사등의 이동에 따른 에어컨 이전 설치 서비스",
      category2: '가전/가구 케어'),
  CategorySub(
      image: 'assets/g_3.jpg',
      title: '에어컨 분해 청소',
      content: "에어컨 전체 분해 후 내부의 먼지, 곰팡이 및 필터 클린 서비스 ",
      category: '가전/가구 케어',
      image2: 'assets/g_4.jpg',
      title2: '세탁기 분해 청소',
      content2: "노후 및 이물 유입인한 악취 제거 및 \n 저하된 성능 향상을 위한 세탁기 분해 클린 서비스",
      category2: '가전/가구 케어'),
  CategorySub(
      image: 'assets/g_5.jpg',
      title: '냉장고 청소',
      content: "냉장고 내/외부 음식물로 인한 오염 및 악취 제거를 위한 클린 서비스",
      category: '가전/가구 케어',
      image2: 'assets/g_6.jpg',
      title2: '맞춤 가구 제작',
      content2: "내부의 공간이나 분위기 연출을 위한\n 맞춤 가구 제작 서비스",
      category2: '가전/가구 케어'),
  CategorySub(
      image: 'assets/g_7.jpg',
      title: '붙박이장 설치',
      content: "벽이나 벽안쪽에 수납공간을 만들어\n 움직일수 없게 옷장을 설치하는 서비스",
      category: '가전/가구 케어',
      image2: 'assets/g_8.jpg',
      title2: '시스템 행거',
      content2:
          "벽앞에 별로도 설치하는 헹거로 개인의 취향에 맞는 설계가 가능하고 \n 이사 등 이동시의 편리함이 장점인\n 설치 서비스",
      category2: '가전/가구 케어'),
  CategorySub(
      image: 'assets/g_9.jpg',
      title: '펜트리 선반 설치',
      content: "주방이나 세탁실 등 펜트리에\n 설치함으로 정리에 도움을 주는 선반\n설치 서비스",
      category: '가전/가구 케어',
      image2: 'assets/g_10.jpg',
      title2: '매트리스 케어',
      content2: "침대의 먼지나 오염 또는 진득이 같은 해중 제거를 위함 \n 클린 및 살균 & 소독 케어 서비스",
      category2: '가전/가구 케어'),
  CategorySub(
      image: 'assets/g_11.jpg',
      title: '쇼파천갈이',
      content: " 노후나 스크래치 등으로 손상된 천이나\n가죽 등을 교체 / 보건 해 주는\n케어 서비스",
      category: '가전/가구 케어',
      image2: 'assets/heater.jpg',
      title2: '보일러 설치',
      content2: "-",
      category2: '가전/가구 케어'),
  CategorySub(
      image: 'assets/plumbing.jpg',
      title: '배관수리 및 청소',
      content: "-",
      category: '가전/가구 케어',
      image2: 'assets/g_12.jpg',
      title2: '기타 가전/가구',
      content2: "식탁 상판 코팅, 벽걸이 TV 설치,\n 벽 시계 설치 등의 가전 / 가구\n 클린 및 케어 서비스",
      category2: '가전/가구 케어'),
];
const List<CategorySub> rentalList = [
  CategorySub(
      image: 'assets/l_1.jpg',
      title: '정수기 렌탈',
      content: "정수기 렌탈 서비스",
      category: '렌탈',
      image2: 'assets/l_2.jpg',
      title2: '에어컨 렌탈',
      content2: "에어컨 렌탈 서비스",
      category2: '렌탈'),
  CategorySub(
      image: 'assets/l_3.jpg',
      title: '비데 렌탈',
      content: "비데 렌탈 서비스",
      category: '렌탈',
      image2: 'assets/l_4.jpg',
      title2: '매트리스 렌탈',
      content2: "매트리스 렌탈 서비스",
      category2: '렌탈'),
  CategorySub(
      image: 'assets/l_5.jpg',
      title: '쇼파 렌탈',
      content: "쇼파 렌탈 서비스",
      category: '렌탈',
      image2: 'assets/l_6.jpg',
      title2: 'TV 렌탈',
      content2: "TV 렌탈 서비스",
      category2: '렌탈'),
  CategorySub(
      image: 'assets/l_7.jpg',
      title: '안마의자 렌탈',
      content: "안마의자 렌탈 서비스",
      category: '렌탈',
      image2: 'assets/l_8.jpg',
      title2: '운동기구 렌탈',
      content2: "운동기구 렌탈 서비스",
      category2: '렌탈'),
  CategorySub(
      image: 'assets/l_9.jpg',
      title: '의류 관리기 렌탈',
      content: "의류 관리기 렌탈 서비스",
      category: '렌탈',
      image2: 'assets/l_10.jpg',
      title2: '식기 세척기 렌탈',
      content2: "식기 세척기 렌탈 서비스",
      category2: '렌탈'),
  CategorySub(
      image: 'assets/l_11.jpg',
      title: '음식물 분쇄기 렌탈',
      content: "음식물 분쇄기 렌탈 서비스",
      category: '렌탈',
      image2: 'assets/l_12.jpg',
      title2: '청소기 렌탈',
      content2: "청소기 렌탈 서비스",
      category2: '렌탈'),
  CategorySub(
      image: 'assets/l_13.jpg',
      title: '공기 청정기 렌탈',
      content: "공기 청정기 렌탈 서비스",
      category: '렌탈',
      image2: 'assets/rental.jpg',
      title2: '기타 렌탈',
      content2: "-",
      category2: '렌탈'),
];
const List<CategorySub> etcList = [
  CategorySub(
      image: 'assets/e_1.jpg',
      title: '사전점검',
      content:
          "신축이나 구축 등 새로운 장소에\n 입주 전 하자나 개/보수가 필요한\n 부분을사전에 점검하여 주는\n 대행 서비스",
      category: '기타',
      image2: 'assets/e_2.jpg',
      title2: '소독/방역',
      content2:
          " 유해 물질, 바이러스, 악취, 공기 질 개선, 해충 박멸 등을 통해\n 쾌적한 환경을 유지하고 내부 오염을\n방지하기 위한 케어 서비스",
      category2: '기타'),
  CategorySub(
      image: 'assets/etc.jpg',
      title: '기타 서비스',
      content: "-",
      category: '기타',
      image2: '',
      title2: '',
      content2: "",
      category2: ''),
];

class CategorySub {
  final String image;
  final String title;
  final String content;
  final String category;
  final String image2;
  final String title2;
  final String content2;
  final String category2;

  const CategorySub({
    required this.image,
    required this.title,
    required this.content,
    required this.category,
    required this.image2,
    required this.title2,
    required this.content2,
    required this.category2,
  });
}
