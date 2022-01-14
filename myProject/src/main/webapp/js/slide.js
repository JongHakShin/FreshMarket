
 $(document).ready(function () {
   
    var index=0;
    autoSlider();
    var sw=false;
    $(".leftControl").fadeOut(500); 
        moveSlider(index);

    $(".leftControl").click(function () { 
        index--;

        if(index == 0) {
            $(this).fadeOut(500);
        } 
        if(index > 0) {
            $(".rightControl").fadeIn(500);
        }
            moveSlider(index);     
    });

    $(".rightControl").click(function () { 
        index++

        if(index == 4) {
            $(this).fadeOut(500);
        } 

        if(index < 4) {
            $(".leftControl").fadeIn(500);
        }
            moveSlider(index);
        
        
    });

    $(".animationCanvas").hover(function(){
        clearInterval(autocontrol)
    }, function(){
        autoSlider();
    });

    function moveSlider(index) {
        $(".sliderPanel").animate({
            left:-(index*1024) 
        },"slow");
        $(".sliderText").hide();
        $(".sliderText").eq(index).fadeIn("slow")
          
    }
    function autoSlider() {
        autocontrol = setInterval(function () {

        if(index<4 && sw==false) {
            $(".rightControl").trigger("click");  

        } else {
            sw=true; 
        }
    
    
        if(index>0 && sw==true) {
            $(".leftControl").trigger("click");
        } else {
            sw=false;
        }
        },3000);
    } 
});