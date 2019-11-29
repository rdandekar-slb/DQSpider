function redraw_polyline(){
        var vote_spider_points = document.getElementById("spider").getAttribute("points").split(" ");
        var cx = parseInt(document.getElementById("centre").getAttribute("x1"));
        var cy = parseInt(document.getElementById("centre").getAttribute("y1"));
        var dividers=[];
        dividers.push(parseInt(document.getElementById("af").value)/100);
        dividers.push(parseInt(document.getElementById("cda").value)/100);
        dividers.push(parseInt(document.getElementById("mi").value)/100);
        dividers.push(parseInt(document.getElementById("cdi").value)/100);
        dividers.push(parseInt(document.getElementById("lr").value)/100);
        dividers.push(parseInt(document.getElementById("ca").value)/100);
        
        var s = "" ;
        for (i=0;i<vote_spider_points.length-1;i++){
            /*console.log(vote_spider_points[i],dividers[i]);*/
            p=vote_spider_points[i].split(",");
            new_p_x=parseInt(p[0])*dividers[i] + cx*(1-dividers[i]);
            new_p_y=parseInt(p[1])*dividers[i] + cy*(1-dividers[i]);
            /*console.log(new_p_x,new_p_y);*/
            s += new_p_x+','+new_p_y+' ';
        }
        vote_spider.setAttribute("points",s);

        /*console.log(s);*/
        /*console.log(af,cda,cdi,mi,lr,ca);*/
        /*console.log(vote_spider_points);*/
        /*console.log(document.getElementById("centre").getAttribute("x1"))  */
        
    }