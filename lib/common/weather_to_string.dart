String weatherToString(int code) {
  // --- 맑음 ~ 흐림 ---
  if (code == 0) return "맑음";
  if (code == 1 || code == 2) return "구름 조금";
  if (code == 3) return "흐림";

  // --- 연무/먼지 ---
  if (code >= 4 && code <= 9) return "연무";

  // --- 안개 ---
  if (code >= 10 && code <= 12) return "안개";
  if (code >= 40 && code <= 49) return "안개";

  // --- 번개 ---
  if (code == 13 || code == 17 || code == 29) return "번개";

  // --- 이슬비 / 비 ---
  if (code >= 50 && code <= 55) return "이슬비";
  if (code == 56 || code == 57) return "이슬비";

  // --- 비 (폭우 포함) ---
  if (code >= 60 && code <= 65 || code == 58 || code == 59) {
    if (code == 64 || code == 65) return "폭우"; // heavy rain
    return "비";
  }

  // --- 진눈깨비 (비 + 눈) ---
  // Codes explicitly describing mixed rain+snow
  if (code == 23 || code == 68 || code == 69) return "진눈깨비";
  if (code == 83 || code == 84) return "진눈깨비";

  // --- 눈 계열 ---
  if (code >= 70 && code <= 79) {
    if (code == 77) return "싸락눈";
    if (code == 74 || code == 75) return "폭설";
    return "눈";
  }

  // --- 소나기 비 ---
  if (code >= 80 && code <= 82) {
    if (code == 82) return "폭우";
    return "소나기";
  }

  // --- 소나기 눈 ---
  if (code == 85 || code == 86) {
    if (code == 86) return "폭설";
    return "눈";
  }

  // --- 싸락눈 소나기 ---
  if (code == 87 || code == 88) return "싸락눈";

  // --- 우박 소나기 ---
  if (code == 89 || code == 90) return "우박";

  // --- 천둥 번개 + 강수 ---
  if (code >= 91 && code <= 99) return "번개";

  return "알 수 없음";
}
