$(function(){
  $(window).on('load', function(){
    $(".saikoro").stop().animate({zIndex:1},{
      //効果の継続時間秒：1秒
      duration:1000,
      //アニメーションの各ステップで呼び出されるコールバック関数
      step:function(now){
        //now に現在の z-index の値（0から1に変化）が渡されます
        //0から1に変化していく now を利用して2回転（720度）させます
        $(this).css({transform:'rotate(' + (now * 720) + 'deg)'});
      },
      //アニメーション完了時に呼び出される関数
      complete:function(){
        //元に戻します（次回実行するために z-index を0に戻す）
        $(this).css('zIndex', 0);
      }      
    })
    $("p").delay(700).show(900);
  });
});