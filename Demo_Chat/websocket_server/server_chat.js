


//______Import Library

var http = require("http"),
    fs = require("fs"),
    path = require("path"),
    ws = require("ws"),
    open = require("open"),
    ProtoBuf = require("protobufjs");


//______Creat Server
var WebSocketServer = ws.Server
  , wss = new WebSocketServer({port: 8000});


//_____Set Data for Animal.proto

var GeneralMessage = ProtoBuf.loadProtoFile(path.join(__dirname + '/GeneralMessage.proto')),
    NewGeneral = GeneralMessage.build("Chat.Message.GeneralMessage");

var RequestMessage = ProtoBuf.loadProtoFile(path.join(__dirname + '/MessageRequest.proto')),
    NewRequest = RequestMessage.build("Chat.Request.RequestMessage");

var ResponseMessage = ProtoBuf.loadProtoFile(path.join(__dirname + '/MessageRespose.proto')),
    NewResponse = ResponseMessage.build("Chat.Response.ResponseMessage"),
    NewPersionSend = ResponseMessage.build("Chat.Response.PersionSend"),
    NewPersionReceive = ResponseMessage.build("Chat.Response.PersionReceive");
 
var UserMessage = ProtoBuf.loadProtoFile(path.join(__dirname + '/UsersMessage.proto')),
    NewUsers = UserMessage.build("Chat.Message.UsersMessage");

// console.log("ReadImages:"+fileBuff);

var clients = [];
var socketsArray = [];
var timeCurrent = getDateTime();

// var users = [];

var mysql = require('mysql')
//
var db = mysql.createConnection({
                                host: 'localhost',
                                user: 'root',
                                database: 'Manual'
                                })

//// Log any errors connected to the db
db.connect(function(err)
{
    if (err) console.log(err);
                       
});


wss.on("connection", function(socket) {

    // setTimeout(socket.end, 10 * 1000);

    // console.log("URL:"+ws.url);

     // socketsArray.push(socket);

    var index = 0;

    socket.on("message", function(data,flags) {

        if (flags.binary) {

            try {
                //____Decode General Message
                var encodeGen = NewGeneral.decode(data);

                if (encodeGen.msgType == 1) {

                    var encodeData = NewRequest.decode(encodeGen.msgPayload);

                    //____Encode Response Message

                    //____Obj send persion
                    var pSend = new NewPersionSend ({
                        "userID":encodeData.perSend.userID,
                        "userName":encodeData.perSend.userName,
                        "userAvatar":encodeData.perSend.userAvatar
                    });

                    //____Obj receive persion
                    var pReceive = new NewPersionReceive ({
                        "userID":encodeData.perReceipt.userID,
                        "userName":encodeData.perReceipt.userName,
                        "userAvatar":encodeData.perReceipt.userAvatar
                    });

                    //___Not Quan trong
                    var bufImg = encodeData.perSend.userAvatar

                    var f=fs.createWriteStream('userAvatar.png');
                    f.write(bufImg.toBuffer());
                    f.end();


                    var response = new NewResponse({

                                                    "status":[{

                                                        "status":"Success",
                                                        "errorCode":1
                                                    }],
                                                    "content":{
                                                        "messageID":0,
                                                        "timeCreate":timeCurrent,
                                                        "content":encodeData.content

                                                    },
                                                    "persionSend":pSend,
                                                    "persionReceive":pReceive

                                                });

                                var resEncode = response.encode();
                                //____Encode General Message

                                var general = new NewGeneral ({
                                    "msgType":1,
                                    "msgPayload":resEncode.toBuffer(),
                                });

                                var gesEncode = general.encode();
                                for (var i = 0; i < wss.clients.length; i++) 
                                {
                                    var socketItem = wss.clients[i];
                                    // if (!socketItem) {return;};

                                        if (socketItem == socket) {

                                            socketItem.send(gesEncode.toBuffer());
                                         }else {
                                            var newObjc = {

                                            "userName":encodeData.perSend.userName,
                                            "timeCreate":timeCurrent,
                                            "userAvatar":images,
                                            "content":encodeData.content

                                            }; 
                                            socketItem.send(JSON.stringify(newObjc));
                                        }
                                    
                                }

                }else if (encodeGen.msgType == 3) {

                    var encodeData = NewUsers.decode(encodeGen.msgPayload);
                    var userID = encodeData.userID;
                    var userName = encodeData.userName;

                    addSocket(userID,userName);


                }


            } catch (err) {
                console.log("Processing failed:", err);
            }

        } else {
            

            var res = data.substring(0, 3);

            if (res == "ws:") {
                
                var userID = data.substring(3, data.length);
                var userName = "User 2";
                addSocket(userID,userName);
            
            
            } else {

                var imgData = fs.readFileSync(path.join(__dirname + '/meAvatar.jpeg'));
                var images = new Buffer(imgData);

                var userName = "User 2";
                var content = data;

                for (var i = 0; i < wss.clients.length; i++) {

                    var socketItem = wss.clients[i];
                    if (socketItem == socket) {

                        var newObjc = {

                        "userName":userName,
                        "timeCreate":timeCurrent,
                        "userAvatar":images,
                        "content":content

                        }; 
                        socketItem.send(JSON.stringify(newObjc));

                    }else {


                        //____Encode Response Message

                        //____Obj send persion
                        var pSend = new NewPersionSend ({
                            "userID":2,
                            "userName":userName,
                            "userAvatar":images
                        });

                        //____Obj receive persion
                        var pReceive = new NewPersionReceive ({
                            "userID":1,
                            "userName":"User 1",
                            "userAvatar":images
                        });


                        var response = new NewResponse({

                                                        "status":[{

                                                            "status":"Success",
                                                            "errorCode":1
                                                        }],
                                                        "content":{
                                                            "messageID":0,
                                                            "timeCreate":timeCurrent,
                                                            "content":content

                                                        },
                                                        "persionSend":pSend,
                                                        "persionReceive":pReceive

                                                    });

                                    var resEncode = response.encode();
                                    //____Encode General Message

                                    var general = new NewGeneral ({
                                        "msgType":1,
                                        "msgPayload":resEncode.toBuffer(),
                                    });

                                    var gesEncode = general.encode();

                                    socketItem.send(gesEncode.toBuffer());
                        
                    }
                }  
            }
        }

    });

    socket.on("close", function() {
        console.log("WebSocket disconnected:"+wss.clients.length);

    });

     socket.on('error', function() {
     console.log('socket error');
               // how do I reconnect to the ws after x minutes here?
     });
});


function addSocket(userID,userName)
{

    var arrayUsers = [];
    var INSERTSQL = "SELECT * FROM sockets WHERE userID='"+userID+"'";
    db.query(INSERTSQL)
    .on('result', function(data)
                          
        {
             arrayUsers.push(data);
    })
    .on('end', function(){

        var indexSocket = wss.clients.length - 1;

        if (arrayUsers.length == 0) {

            saveSocketToDB(userID,indexSocket);
            console.log(userName+" have been connection to Server!"); 
        }else {

            editSocketToDB(userID,indexSocket);
            console.log(userName+" have been reconnection:"+wss.clients); 
        }

                            // console.log("WebSocket connection:"+wss.clients.length);
    })
}

//________Save Socket To DataBase
function saveSocketToDB(useID,index)
{
    var queryDB = "INSERT INTO sockets(userID,socket_index) VALUES ("+useID+","+index+")";
                    db.query(queryDB);
}
//________Save Socket To DataBase
function editSocketToDB(useID,index)
{
    var queryDB = "UPDATE sockets SET socket_index="+index+" WHERE userID="+useID;
                    db.query(queryDB);
}


//________Optional Server

function optionalServer(name,data)
{
    switch(name) {
        case '/':
            sys.puts("display root");
        break;
        case '/create':
            sys.puts("display create");
        break;
        case '/edit':
            sys.puts("display edit");
        break;
        default:
            sys.puts("oh dear, 404");
    }
}

//________Get current time system
function getDateTime() {

    var date = new Date();

    var hour = date.getHours();
    hour = (hour < 10 ? "0" : "") + hour;

    var min  = date.getMinutes();
    min = (min < 10 ? "0" : "") + min;

    var sec  = date.getSeconds();
    sec = (sec < 10 ? "0" : "") + sec;

    var year = date.getFullYear();

    var month = date.getMonth() + 1;
    month = (month < 10 ? "0" : "") + month;

    var day  = date.getDate();
    day = (day < 10 ? "0" : "") + day;

    return hour + ":" + min + " - " + day + "/" + month + "/" + year;

}

