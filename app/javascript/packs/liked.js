function liked() {
    // 表示されているすべてのメモを取得している
    const like = document.querySelectorAll(".like-link");
    like.forEach(function (like) {
        likes.addEventListener("click", () => {
        // どのメモをクリックしたのか、カスタムデータを利用して取得している
        const likeId = like.getAttribute("data-id");
        // Ajaxに必要なオブジェクトを生成している
        const XHR = new XMLHttpRequest();
        // openでリクエストを初期化する
        XHR.open("GET", `/likes/${likeId}`, true);
        // レスポンスのタイプを指定する
        XHR.responseType = "json";
        // sendでリクエストを送信する
        XHR.send();
        // レスポンスを受け取った時の処理を記述する
        XHR.onload = () => {
          if (XHR.status != 200) {
            // レスポンスの HTTP ステータスを解析し、該当するエラーメッセージをアラートで表示するようにしている
            alert(`Error ${XHR.status}: ${XHR.statusText}`);
            // 処理を終了している
            return null;          
          }
          // レスポンスされたデータを変数itemに代入している
          const item = XHR.response.post;
          if (item.checked === true) {
            // 既読状態であれば、灰色に変わるcssを適用するためのカスタムデータを追加している
            post.setAttribute("data-check", "true");
          } else if (item.checked === false) {
            // 未読状態であれば、カスタムデータを削除している
            post.removeAttribute("data-check");
          }
        };
      });
    });
  }
  setInterval(check, 1000);