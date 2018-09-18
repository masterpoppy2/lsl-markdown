// ********************************************
// lsl-markdown.lsl (Stand Alone HUD type)
// 2018.09.18 MasterPoppy
// ********************************************
//CUSTOM CSS (optional)
string css = "";

//html
string html = "<!DOCTYPE html>
<html>
<head>
<meta charset='UTF-8'>
<script type='text/javascript' src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js'></script>
<script type='text/javascript' src='https://cdnjs.cloudflare.com/ajax/libs/markdown-it/8.0.0/markdown-it.min.js'></script>
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/github-markdown-css/2.4.1/github-markdown.css'></link>
<script src='https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.4/semantic.min.js'></script>
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.4/components/button.min.css'></link>
<style type='text/css'>
@import url(http://fonts.googleapis.com/earlyaccess/notosansjapanese.css);
body{background-color: #FFFFFF;}
body,
div#md,
.markdown-body {
font-family: 'Noto Sans', 'Noto Sans Japanese', arial, helvetica, 'hiragino kaku gothic pro', meiryo, 'MS PGothic', sans-serif;
}
.markdown-body code {
font-family: Consolas, 'Liberation Mono', Menlo, Courier, 'Osaka-mono', 'MS Gothic', monospace;
}
</style>
<script>
var read_line;
var loaded;
var displayname = 'DisplayName';
//markdown-it
var md = window.markdownit({
html: true,
linkify: true,
typographer: true,
breaks: true
});
//onload event
$(document).ready(function() {
read_line = 0;
loaded = '';
$('#debug').html('LOADING lsl-markdown ...');
var zoom = 100;
var max = 250;
var min = 50;
$('.zoom').click(function() {
var click = $(this).text();
if (click === 'Reset') {
zoom = 100;
} else if (click === 'ZoomIn') {
zoom *= 1.1;
if (max < zoom) zoom = max;
} else if (click === 'ZoomOut') {
zoom *= 0.9;
if (zoom < min) zoom = min;
}
$('.markdown-body').css('zoom', zoom + '%');
});
$('#minimize').click(function() {
$.ajax({
'type': 'POST',
'url': location.href,
'data': 'minimize'
})
});
$('#close').click(function() {
$.ajax({
'type': 'POST',
'url': location.href,
'data': 'close'
})
});
//Custom CSS
$.ajax({
'type': 'POST',
'url': location.href,
'dataType': 'text',
'data': 'loadcss'
}).done(function(data) {
$('head').append('<style></style>').children(':last').attr({
type: 'text/css'
}).text(data);
});
//Get DispayName
$.ajax({
'type': 'POST',
'url': location.href,
'dataType': 'text',
'data': 'displayname'
}).done(function(data) {
displayname = data;
});
//start load
if (-1 === document.location.toString().lastIndexOf('.html')) {
read(0);
}
});
// ***For local test***
$.get('sample en.md').done(function(data) {
$('#debug').hide();
$('#md').html(md.render(data.replace(/%OWNER/g, displayname)));
});
$.get('style.css').done(function(data) {
$('head').append('<style></style>').children(':last').attr({
type: 'text/css'
}).text(data);
});
//*******************
function read(line) {
$.ajax({
'type': 'POST',
'url': location.href,
'dataType': 'json',
'data': JSON.stringify({
'read': line
})
}).done(function(data) {
read_line = data.read_line;
var readed = data.str;
if (read_line === -1) {
$('#debug').hide();
loaded = readed;
} else if (read_line === -2) {
$('#debug').html('LOADING COMPLETED.');
location.reload();
} else {
$('#debug').html('LOADING LINE : ' + read_line + ' / MEMORY : ' + data.memory);
loaded += '\\n' + readed;
++read_line;
read(read_line);
}
$('#md').html(md.render(loaded.replace(/%OWNER/g, displayname)));
$('a[href^=http]').click(function(e) {
e.preventDefault();
loadlink(this.href);
});
}).fail(function(data) {
$('#debug').html(data.responseText).css('background-color', '#f8dce0');
});
}
function loadlink(uri) {
$.ajax({
'type': 'POST',
'url': location.href,
'data': JSON.stringify({
'link': uri
})
})
}
</script>
<script type='text/javascript' src='https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js'></script>
<script>
//smooth scroll
scrLength = 200;
var mousewheelevent = 'onwheel' in document ? 'wheel' : 'onmousewheel' in document ? 'mousewheel' : 'DOMMouseScroll';
$(document).on(mousewheelevent, function(e) {
e.preventDefault();
var delta = e.originalEvent.deltaY ? -(e.originalEvent.deltaY) : e.originalEvent.wheelDelta ? e.originalEvent.wheelDelta : -(e.originalEvent.detail);
if (delta < 0) {
scrSet = $(document).scrollTop() + scrLength;
} else {
scrSet = $(document).scrollTop() - scrLength;
}
$('html,body').stop().animate({
scrollTop: scrSet
}, 500, 'easeOutCirc');
return false;
});
</script>
</head>
<body>
<div class='ui right floated vertical basic buttons ' style='position:fixed;bottom:2vh;right:2vw;'>
<button id='close' class='ui button'>Close</button>
<button id='minimize' class='ui button'>Minimize</button>
<button id='zoomin' class='ui button zoom'>ZoomIn</button>
<button id='zoomreset' class='ui button zoom'>Reset</button>
<button id='zoomout' class='ui button zoom'>ZoomOut</button>
</div>
<div id='debug'>
***
</div>
<div id='md' class='markdown-body' style='padding: 10px;'>
</div>
</body>
</html>
";

integer i;
key nquery_id;
integer line;
key query_id;
integer read_line;
string readed = "";
string notecardname;
key notecard_key = NULL_KEY;
integer status;
key request;
key client;
string URI;
integer render_face = 4; //-X
vector scale;
vector position;
string msgstr;

load_start()
{
    readed = "";
    read_line = 0;
    notecardname = llGetInventoryName(INVENTORY_NOTECARD, 0);
    if (llGetInventoryType(notecardname) == INVENTORY_NOTECARD)
    {
        notecard_key = llGetInventoryKey(notecardname);
        nquery_id = llGetNumberOfNotecardLines(notecardname);
    }
    else{
        llSay(DEBUG_CHANNEL,"Not found notecard:" + notecardname);
    }
}

float W;
float H;

calq_scale()
{
    scale = llGetScale();
    if(scale.z == scale.y){
        W = 1024;
        H = 1024;
    }
    else if(scale.z < scale.y){
        W = 1024;
        H = 1024.0 * scale.z / scale.y;
    }
    else if(scale.z > scale.y){
        W = 1024.0 * scale.y / scale.z;
        H = 1024;
    }
}

string check_memory()
{
    float freemem = 64.0 - llGetFreeMemory() / 1024.0;
    return (string)freemem + " / 64 kbyte (" + llDeleteSubString((string)(0.01 * (float)llFloor(10000 * (freemem / 64.0))), -4 , -1) + " %)";
}

default
{
    state_entry()
    {
        llReleaseURL(URI);
        request = llRequestURL();
        //llOwnerSay(check_memory());
        msgstr = llList2Json(JSON_OBJECT, [
        "en", "Please confirm that `Media` checkbox is enabled and touch HUD again if screen does not switch. If screen will not switch in spite of `Media` checkbox enabled, enable Auto-Play checkbox additionally. Refer to following URL for the detail instruction. https://gyazo.com/752c6a699a1fc377030c0e50af65db90",
        "ja", "画面が切り替わらないときはメディア再生のチェックが入っているか確認してもう一度HUDをタッチしてください。 メディア再生にチェックをいれても切り替わらないときはさらに自動再生のチェックをいれてください。 くわしい解説はこちらのURLを参照してください。 https://gyazo.com/e0ccc8a3da41d4c95380bacc3417829c"
        ]);
        load_start();
    }

    changed(integer change)
    {
        if(change & CHANGED_INVENTORY){
            key note_key = llGetInventoryKey(notecardname);
            if(note_key != notecard_key){
                llReleaseURL(URI);
                request = llRequestURL();
                load_start();
            }
        }
        else if(change & CHANGED_REGION || change & CHANGED_REGION_START){
            llReleaseURL(URI);
            request = llRequestURL();
        }
        else if(change & CHANGED_SCALE){
            calq_scale();
            status = llSetLinkMedia(LINK_THIS, render_face, [
            PRIM_MEDIA_WIDTH_PIXELS, W,
            PRIM_MEDIA_HEIGHT_PIXELS, H
            ]);
        }
    }

    on_rez(integer start_param)
    {
        llReleaseURL(URI);
        request = llRequestURL();
    }

    attach(key id)
    {
        if(id){
            llReleaseURL(URI);
            request = llRequestURL();
        }
    }

    dataserver(key queryid, string data)
    {
        if (queryid == query_id)
        {
            llSetContentType(client, CONTENT_TYPE_JSON);
            if (data != EOF){
                llHTTPResponse(client, 200, llList2Json(JSON_OBJECT, ["str", data, "memory", check_memory(), "read_line", read_line]));
                readed += "\n" + data;
            }
            else{
                llHTTPResponse(client, 200, llList2Json(JSON_OBJECT, ["str", "", "read_line", -2]));
                readed += "\n" + EOF;
            }
        }
    }

    http_request(key id, string method, string body)
    {
        if (request == id){
            request = "";
            if (method == URL_REQUEST_GRANTED){
                URI = body;
                //llSetObjectDesc(URI);
                calq_scale();
                status = llSetLinkMedia(LINK_THIS, render_face, [
                PRIM_MEDIA_HOME_URL, URI,
                PRIM_MEDIA_CURRENT_URL, URI,
                PRIM_MEDIA_AUTO_ZOOM, TRUE,
                PRIM_MEDIA_AUTO_PLAY, TRUE,
                PRIM_MEDIA_AUTO_SCALE, FALSE,
                PRIM_MEDIA_WIDTH_PIXELS, W,
                PRIM_MEDIA_HEIGHT_PIXELS, H,
                PRIM_MEDIA_PERMS_INTERACT, PRIM_MEDIA_PERM_NONE,
                PRIM_MEDIA_PERMS_CONTROL, PRIM_MEDIA_PERM_NONE
                ]);
                llSetTimerEvent(10.0);
            }
            else if (method == URL_REQUEST_DENIED){
                llOwnerSay("Something went wrong, no url:\n" + body);
            }
        }
        else{
            if(method == "GET" || method == "HEAD"){
                llSetTimerEvent(0);
                llSetContentType(id, CONTENT_TYPE_HTML);
                llHTTPResponse(id, 200, html);
            }
            else if(method == "POST"){
                string read = llJsonGetValue(body, ["read"]);
                string link = llJsonGetValue(body, ["link"]);
                if(read != JSON_INVALID){
                    client = id;
                    if((integer)read == 0){
                        if(readed == ""){
                            read_line = 0;
                            query_id = llGetNotecardLine(notecardname, 0);
                        }
                        else{
                            llSetContentType(client, CONTENT_TYPE_JSON);
                            llHTTPResponse(client, 200, llList2Json(JSON_OBJECT, ["str", readed, "read_line", -1]));
                        }
                    }
                    else{
                        read_line = (integer)read;
                        query_id = llGetNotecardLine(notecardname, read_line);
                    }
                }
                else if(link != JSON_INVALID){
                    llLoadURL(llGetOwner(), link, link);
                }
                else if(body == "loadcss"){
                    if(css){
                        llSetContentType(id, CONTENT_TYPE_TEXT);
                        llHTTPResponse(id, 200, css);
                    }
                }
                else if(body == "displayname"){
                    llSetContentType(id, CONTENT_TYPE_TEXT);
                    llHTTPResponse(id, 200, llGetDisplayName(llGetOwner()));
                }
                else if(body == "minimize"){
                    integer point = llGetAttached();
                    if(point){
                        position = llGetLocalPos();
                        vector moveto;
                        if( (point == ATTACH_HUD_CENTER_1 ) | (point == ATTACH_HUD_CENTER_2) ){
                            if(position.z >= 0){
                                moveto = position + <0,0,scale.z/2-scale.x/2>;
                            }
                            else{
                                moveto = position - <0,0,scale.z/2-scale.x/2>;
                            }
                        }
                        else if( (point == ATTACH_HUD_TOP_RIGHT) |  (point == ATTACH_HUD_TOP_CENTER) |  (point == ATTACH_HUD_TOP_LEFT) ){
                            moveto = position + <0,0,scale.z/2-scale.x/2>;
                        }
                        else if( (point == ATTACH_HUD_BOTTOM_RIGHT) |  (point == ATTACH_HUD_BOTTOM) |  (point == ATTACH_HUD_BOTTOM_LEFT) ){
                            moveto = position - <0,0,scale.z/2-scale.x/2>;
                        }
                        llSetLinkPrimitiveParamsFast(LINK_THIS, [
                        PRIM_POS_LOCAL, moveto,
                        PRIM_ROT_LOCAL, llEuler2Rot(<0,PI_BY_TWO,0>)
                        ]);
                    }
                }
                else if(body == "close"){
                    if(llGetAttached()){
                        llRequestPermissions(llGetOwner(), PERMISSION_ATTACH );
                        llDetachFromAvatar();
                    }
                }
                else{
                    llSay(DEBUG_CHANNEL, "parameter error:body=" + body);
                }
            }
        }
    }
    
    timer()
    {
        key owner = llGetOwner();
        string lang = llGetAgentLanguage(owner);
        string instruction = llJsonGetValue(msgstr, [lang]);
        if(instruction == JSON_INVALID){
            instruction = llJsonGetValue(msgstr, ["en"]);
        }
        llRegionSayTo(owner, 0, instruction);
        llSetTimerEvent(0);
    }
    
    touch_end(integer index)
    {
        if(llGetAttached() && llDetectedTouchFace(0) != render_face){
            llSetLinkPrimitiveParamsFast(LINK_THIS, [
            PRIM_POS_LOCAL, position,
            PRIM_ROT_LOCAL, ZERO_ROTATION
            ]);
        }
    }
}
