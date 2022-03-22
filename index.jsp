
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <%@ include file="/banner.jsp" %>
        <div>
            <div class = "chronoTable">
                <div  class="mt-5 w-50 float-left">
                    <div class="timer mb-4" style="margin-left: 65px">
                        
                        <h1 contenteditable="true" id="hour" class="hour" style="width: 60px; display: inline;">00</h1>
                        <h1 style="display: inline;">:</h1>
                        <h1 contenteditable="true" id="minute" class="minute" style="width: 60px; display: inline;">00</h1>
                        <h1 style="display: inline;">:</h1>
                        <h1 contenteditable="true" id="second" class="second" style="width: 60px; display: inline;">00</h1>
                        
                        
                    </div>
                    <div style="margin-left: 10px">    
                        <button class="btn btn-success mx-3" id="start">Start</button>
                        <button class="btn btn-danger mx-3" id="stop">Stop</button>
                        <button class="btn btn-warning mx-3" id="reset">Reset</button>
                        <button class="btn btn-dark " onclick="exportTableToCSV('MatchData.csv')" style="margin-left: 60px; margin-right: 30px">Exportar CSV</button>
                    </div>
                    </div>
                <div class = "w-50 float-right " style="overflow-x: scroll;">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                              <th>Equipo</th>
                              <th>Jugador</th>
                              <th>Evento</th>
                              <th>Mins</th>
                              <th>Segs</th>
                              <th>X</th>
                              <th>Y</th>
                              <th>X2</th>
                              <th>Y2</th>
                              <th>❌</th>
                            </tr>
                        </thead>
                    </table>
                
                <div id="tabla" class = "tabla">    
                    <table class="table table-bordered">
                        
                        <tbody id="resultados">
                            
                        </tbody>
                    </table>
                </div>
                </div>
            </div>
        </div>
        <div class = "data">
            <div class = "tags">    
                    <div class="all-tags" >

                        <span class="btn btn-lg btn-outline-success home hometeam active" id ="selected-team" contenteditable="true" style="width:120px;">
                            Home
                        </span>
                        <span class="btn btn-lg btn-outline-danger ml-2 away awayteam" contenteditable="true" style="width:120px;">
                            Away
                        </span>
                        <div class = "mt-2">
                            <span contenteditable class="btn  btn-success home hometags" style="width:120px;">
                                H1
                            </span>
                          <span contenteditable class="btn ml-2  btn-danger away awaytags" style="width:120px;">A1</span > 
                        </div>
                        <div class = "mt-2">
                            <span contenteditable class="btn  btn-success home hometags" style="width:120px;">
                                H2
                            </span>
                          <span contenteditable class="btn ml-2  btn-danger away awaytags" style="width:120px;">A2</span > 
                        </div>
                       <div class = "mt-2">
                            <span contenteditable class="btn  btn-success home hometags" style="width:120px;">
                                H3
                            </span>
                          <span contenteditable class="btn ml-2  btn-danger away awaytags" style="width:120px;">A3</span > 
                        </div>
                        <div class = "mt-2">
                            <span contenteditable class="btn  btn-success home hometags" style="width:120px;">
                                H4
                            </span>
                          <span contenteditable class="btn ml-2  btn-danger away awaytags" style="width:120px;">A4</span > 
                        </div>
                        <div class = "mt-2">
                            <span contenteditable class="btn  btn-success home hometags" style="width:120px;">
                                H3
                            </span>
                          <span contenteditable class="btn ml-2  btn-danger away awaytags" style="width:120px;">A3</span > 
                        </div>
                        <div class = "mt-2">
                            <span contenteditable class="btn  btn-success home hometags" style="width:120px;">
                                H5
                            </span>
                          <span contenteditable class="btn ml-2  btn-danger away awaytags" style="width:120px;">A5</span > 
                        </div>
                        <div class = "mt-2">
                            <span contenteditable class="btn  btn-success home hometags" style="width:120px;">
                                H6
                            </span>
                          <span contenteditable class="btn ml-2  btn-danger away awaytags" style="width:120px;">A6</span > 
                        </div>
                        <div class = "mt-2">
                            <span contenteditable class="btn  btn-success home hometags" style="width:120px;">
                                H7
                            </span>
                          <span contenteditable class="btn ml-2  btn-danger away awaytags" style="width:120px;">A7</span > 
                        </div>
                        <div class = "mt-2">
                            <span contenteditable class="btn  btn-success home hometags" style="width:120px;">
                                H8
                            </span>
                          <span contenteditable class="btn ml-2  btn-danger away awaytags" style="width:120px;">A8</span > 
                        </div>
                        <div class = "mt-2">
                            <span contenteditable class="btn  btn-success home hometags" style="width:120px;">
                                H9
                            </span>
                          <span contenteditable class="btn ml-2  btn-danger away awaytags" style="width:120px;">A9</span > 
                        </div>
                        <div class = "mt-2">
                            <span contenteditable class="btn  btn-success home hometags" style="width:120px;">
                                H10
                            </span>
                          <span contenteditable class="btn ml-2  btn-danger away awaytags" style="width:120px;">A10</span > 
                        </div>
                        <div class = "mt-2">
                            <span contenteditable class="btn  btn-success home hometags" style="width:120px;">
                                H11
                            </span>
                          <span contenteditable class="btn ml-2  btn-danger away awaytags" style="width:120px;">A11</span > 
                        </div>
                        <div class = "mt-2">
                            <span contenteditable class="btn  btn-success home hometags" style="width:120px;">
                                H12
                            </span>
                          <span contenteditable class="btn ml-2  btn-danger away awaytags" style="width:120px;">A12</span > 
                        </div>
                        <div class = "mt-2">
                            <span contenteditable class="btn  btn-success home hometags" style="width:120px;">
                                H13
                            </span>
                          <span contenteditable class="btn ml-2  btn-danger away awaytags" style="width:120px;">A13</span > 
                        </div>
                        <div class = "mt-2">
                            <span contenteditable class="btn  btn-success home hometags" style="width:120px;">
                                H14
                            </span>
                          <span contenteditable class="btn ml-2  btn-danger away awaytags" style="width:120px;">A14</span > 
                        </div>
                        <div class = "mt-2">
                            <span contenteditable class="btn  btn-success home hometags" style="width:120px;">
                                H14
                            </span>
                          <span contenteditable class="btn ml-2  btn-danger away awaytags" style="width:120px;">A14</span > 
                        </div>
                        <div class = "mt-2">
                            <span contenteditable class="btn  btn-success home hometags" style="width:120px;">
                                H15
                            </span>
                          <span contenteditable class="btn ml-2  btn-danger away awaytags" style="width:120px;">A15</span > 
                        </div>
                        <div class = "mt-2">
                            <span contenteditable class="btn  btn-success home hometags" style="width:120px;">
                                H16
                            </span>
                          <span contenteditable class="btn ml-2  btn-danger away awaytags" style="width:120px;">A16</span > 
                        </div>
                        <div class = "mt-2">
                            <span contenteditable class="btn  btn-success home hometags" style="width:120px;">
                                H17
                            </span>
                          <span contenteditable class="btn ml-2  btn-danger away awaytags" style="width:120px;">A17</span > 
                        </div>
                        <div class = "mt-2">
                            <span contenteditable class="btn  btn-success home hometags" style="width:120px;">
                                H18
                            </span>
                          <span contenteditable class="btn ml-2  btn-danger away awaytags" style="width:120px;">A18</span > 
                        </div>
                        <div class = "mt-2">
                            <span contenteditable class="btn  btn-success home hometags" style="width:120px;">
                                H19
                            </span>
                          <span contenteditable class="btn ml-2  btn-danger away awaytags" style="width:120px;">A19</span > 
                        </div><!-- comment -->
                        <div class = "mt-2">
                            <span contenteditable class="btn  btn-success home hometags" style="width:120px;">
                                H20
                            </span>
                          <span contenteditable class="btn ml-2  btn-danger away awaytags" style="width:120px;">A20</span > 
                        </div><!-- comment -->
                        <div class = "mt-2">
                            <span contenteditable class="btn  btn-success home hometags" style="width:120px;">
                                H21
                            </span>
                          <span contenteditable class="btn ml-2  btn-danger away awaytags" style="width:120px;">A21</span > 
                        </div>
                        <div class = "mt-2">
                            <span contenteditable class="btn  btn-success home hometags" style="width:120px;">
                                H22
                            </span>
                          <span contenteditable class="btn ml-2  btn-danger away awaytags" style="width:120px;">A22</span > 
                        </div>

                    </div>
                
                    <div class = "tags-action" id="tags-action">
                        <span contenteditable ="true" class="btn  btn-info action-tags active" id="selected-tag" style="width:130px;" onclick = "changeEventFocus()">
                            Disparo 
                        </span>
                        <span contenteditable ="true" class="btn  btn-info action-tags mt-2" style="width:130px;" onclick = "changeEventFocus()">
                            Asistencia
                        </span>
                        <span contenteditable ="true" class="btn  btn-info action-tags mt-2" style="width:130px;" onclick = "changeEventFocus()">
                            Pase
                        </span>
                        <span contenteditable ="true" class="btn  btn-info action-tags mt-2" style="width:130px;" onclick = "changeEventFocus()">
                            Drible
                        </span>
                        <span contenteditable ="true" class="btn  btn-info action-tags mt-2" style="width:130px;" onclick = "changeEventFocus()">
                            Centro
                        </span>
                    </div>
                    <div class="btn-add">
                        <button class="btn btn-secondary btnadd" id="btnadd">Añadir Acciones</button>
                    </div>
            </div>

            <div class = "cancha" id="cancha">
                <img class="no-select img-fluid" src="img/pitch.jpg" alt="alt" height = "450"  draggable='false' />
            </div>
    </div>
        
        
    </body>
    <script src="js/timer.js"></script>
    <script src="js/record.js"></script>
</html>
