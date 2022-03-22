let downX = 0;
let downY = 0;
let paused = false;
let pitchlist = [];
var i = 0;
var isDragging = false;
$(document).ready(function(){
  
  $(".home").click(function(){
    
    $(".awayteam").removeAttr('id');
    $(".hometeam").attr('id',"selected-team");
    $(".hometeam").addClass("active");
    $(".awayteam").removeClass("active");
    if(event.target.classList.contains('hometags')){
        if(!$(".hometags").hasClass("active")){
          $("#selected-player").removeAttr('id');
          event.target.setAttribute('id','selected-player');
          event.target.classList.add("active");
          
      }
      else{
          $("#selected-player").removeAttr('id');
          $(".hometags").removeClass("active");
          event.target.setAttribute('id','selected-player');
          event.target.classList.add("active");
          
      }
     }
     $(".awaytags").removeClass("active");
  });
  
  $(".away").click(function(){
    
    $(".hometeam").removeAttr('id');
    $(".awayteam").attr('id',"selected-team");
    $(".hometeam").removeClass("active");
    $(".awayteam").addClass("active");
    if(event.target.classList.contains('awaytags')){
        if(!$(".awaytags").hasClass("active")){
          $("#selected-player").removeAttr('id');
          event.target.setAttribute('id','selected-player');
          event.target.classList.add("active");
          $(".hometags").removeClass("active");
        }
      else{
          $("#selected-player").removeAttr('id');
          $(".awaytags").removeClass("active");
          event.target.setAttribute('id','selected-player');
          event.target.classList.add("active");
          $(".hometags").removeClass("active");
      }
    }
  });
  
  
  
    $(".btnadd").click(function(){
      
       
        var btn = "<span contenteditable ="+"\"true\""+" class="+"\"btn  btn-info action-tags mt-2\""+" style="+"\"width:130px;\" onclick = "+"\"changeEventFocus()\">Nueva accion</span>";
       
       $(".tags-action").append(btn);
      
  });
    
    $(".btnerase").click(function(){
        document.querySelector('table').deleteRow(event);
    });
    
    $(".cancha").mousedown(function(){
        getFirstCords();
    });
    
    $(".cancha").mouseup(function(){
        let team = document.getElementById('selected-team');
        let hour = document.getElementById('hour');
        let minute = document.getElementById('minute');
        let second = document.getElementById('second');
        let player = document.getElementById('selected-player');
        let coords = getSecondCords();
        let tag = document.getElementById('selected-tag');
        let x = downX;
        let y = downY;
        let x2, y2;
        if (coords[2] == 'Drag') {
            x2 = coords[0];
            y2 = coords[1];
        } else {
            x2 = '-';
            y2 = '-';
        }
        let playerName;
        
        if (document.getElementById('selected-player')) {
            
            playerName = player.innerHTML;
        } else {
            playerName = '-';
        }
        console.log(team.innerHTML+", "+playerName+", "+tag.innerHTML+", "
                +((parseInt(hour.innerHTML)*60)+parseInt(minute.innerHTML))+", "
                +second.innerHTML+", "+", "+x+", "+y+", "+x2+", "+y2);
        
        
        tb = document.getElementById('resultados');
        
        
        tr = document.createElement("tr");
        td1 = document.createElement("td");
	td1.appendChild(document.createTextNode(team.innerHTML));
	tr.appendChild(td1);
        
    
        td2 = document.createElement("td");
	td2.appendChild(document.createTextNode(playerName));
	tr.appendChild(td2);
        
      
        td3 = document.createElement("td");
	td3.appendChild(document.createTextNode(tag.innerHTML));
	tr.appendChild(td3);
        
     
        td4 = document.createElement("td");
	td4.appendChild(document.createTextNode(((parseInt(hour.innerHTML)*60)+parseInt(minute.innerHTML))));
	tr.appendChild(td4);
        
     
        td5 = document.createElement("td");
	td5.appendChild(document.createTextNode(parseInt(second.innerHTML)));
	tr.appendChild(td5);
        
        td6 = document.createElement("td");
	td6.appendChild(document.createTextNode(x));
	tr.appendChild(td6);
        
        td7 = document.createElement("td");
	td7.appendChild(document.createTextNode(y));
	tr.appendChild(td7);
        
        td8 = document.createElement("td");
	td8.appendChild(document.createTextNode(x2));
	tr.appendChild(td8);
        
        td9 = document.createElement("td");
	td9.appendChild(document.createTextNode(y2));
	tr.appendChild(td9);
        
        td10 = document.createElement("td");
        var btn = "<button class= \"btn-danger\" onclick=\"deleteRow(this)\">X</button>";
        td10.insertAdjacentHTML('beforeend',btn);
	tr.appendChild(td10);
        
        tb.appendChild(tr);
        var messageBody = document.getElementById("tabla");
        messageBody.scrollTop = messageBody.scrollHeight;
    });
    
    
});

function changeEventFocus() {
  if($(".action-tags").hasClass("active")){
            $(".action-tags").removeClass("active");
            $(".action-tags").removeAttr('id');
        }
        event.target.classList.add("active");
        event.target.setAttribute('id','selected-tag');
}

function getFirstCords(){
    rect = event.target.getBoundingClientRect(); //get pitch dimensions
  let x = (event.clientX - rect.left) / document.getElementById('cancha').offsetWidth; //x position within the element.
  let y = (event.clientY - rect.top) / document.getElementById('cancha').offsetHeight;

  linex1 = x;
  liney1 = y;

  downX = Math.round(x * 100);
  downY = Math.round(y * 100);
}

function getSecondCords(){
    let rect = event.target.getBoundingClientRect(); //get pitch dimensions

        let x = (event.clientX - rect.left) / document.getElementById('cancha').offsetWidth;
        let y = (event.clientY - rect.top) / document.getElementById('cancha').offsetHeight;

        x = Math.round(x * 100);
        y = Math.round(y * 100);

        if (x >= downX - 2 && x <= downX + 2 && y >= downY - 2 && y <= downY + 2) {
            return [x, y, 'Click'];
        }
        return [x, y, 'Drag'];
}

function deleteRow(butn){
    var row = butn.parentNode.parentNode;
  row.parentNode.removeChild(row);

}

function exportTableToCSV(filename) {
  var csv = [];
  var rows = document.querySelectorAll('table tr');

  for (var i = 0; i < rows.length; i++) {
    var row = [],
      cols = rows[i].querySelectorAll('td, th');

    for (var j = 0; j < cols.length - 1; j++) row.push(cols[j].innerText);

    csv.push(row.join(','));
  }

  // Download CSV file
  downloadCSV(csv.join('\n'), filename);
}

function downloadCSV(csv, filename) {
  let csvFile;
  let downloadLink;

  // CSV file
  csvFile = new Blob([csv], { type: 'text/csv' });

  // Download link
  downloadLink = document.createElement('a');

  // File name
  downloadLink.download = filename;

  // Create a link to the file
  downloadLink.href = window.URL.createObjectURL(csvFile);

  // Hide download link
  downloadLink.style.display = 'none';

  // Add the link to DOM
  document.body.appendChild(downloadLink);

  // Click download link
  downloadLink.click();
}


//$(".action-tags").click(function(){
//       
//        if($(".action-tags").hasClass("active")){
//            $(".action-tags").removeClass("active");
//            $(".action-tags").removeAttr('id');
//        }
//        event.target.classList.add("active");
//        event.target.setAttribute('id','selected-tag');
//      
//  });