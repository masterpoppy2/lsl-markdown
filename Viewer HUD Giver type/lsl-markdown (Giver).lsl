// ********************************************
// lsl-markdown (Viewer HUD Giver type - giver)
// 2017.04.15 MasterPoppy
// ********************************************
integer i;
integer line;
key query_id;
key nquery_id;
key pquery_id;
integer read_line;
string readed = "";
string notecardname;
key notecard_key = NULL_KEY;
string password = "password";
key password_key = NULL_KEY;
key request;
string URI;
key av;

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
        llSay(DEBUG_CHANNEL,"Not found notecard.");
    }
}

default
{
    state_entry()
    {
        llReleaseURL(URI);
        load_start();
        llSetText(llGetObjectName() + "\n" + llGetObjectDesc(), <1,1,1>, 1.0);
    }
    
    dataserver(key queryid, string data)
    {
        if (queryid == nquery_id)
        {
            if ((integer)data)
            {
                line = (integer)data;
                read_line = 0;
                query_id = llGetNotecardLine(notecardname, (integer)read_line);
                llSetText("LOADING 0/" + (string)line, <1,1,1>, 1.0);
            }
        }
        else if (queryid == query_id)
        {
            if (data != EOF)
            {
                readed += "\n" + data;
                ++read_line;
                query_id = llGetNotecardLine(notecardname, (integer)read_line);
                llSetText("LOADING " +  (string)read_line + "/" + (string)line, <1,1,1>, 1.0);
            }
            else{
                llSetText("", ZERO_VECTOR, 1.0);
                state active;
            }
        }
    }
    
    changed(integer change)
    {
        if(change & CHANGED_INVENTORY){
            key note_key = llGetInventoryKey(notecardname);
            if(note_key != notecard_key){
                load_start();
            }
        }
    }
}

state active
{
    state_entry()
    {
        request = llRequestURL();
        llSetText(llGetObjectName() + "\n" + llGetObjectDesc(), <1,1,1>, 1.0);
    }
    
    touch_end(integer index)
    {
        string obj = llGetInventoryName(INVENTORY_OBJECT, 0);
        if(obj){
            av = llDetectedKey(0);
            llRezAtRoot(obj, llGetPos(), ZERO_VECTOR, llGetRot(), 1);
        }
    }
    
    object_rez(key id)
    {
        llRegionSayTo(id, -1, notecardname + "," + (string)av + "," + URI);
    }
    
    http_request(key id, string method, string body)
    {
        if (request == id){
            request = "";
            if (method == URL_REQUEST_GRANTED){
                URI = body;
            }
            else if (method == URL_REQUEST_DENIED){
                llSay(DEBUG_CHANNEL,"Something went wrong, no url:\n" + body);
            }
        }
        else{
            if(method == "GET"){
                llSetContentType(id, CONTENT_TYPE_TEXT);
                llHTTPResponse(id, 200, readed);
            }
        }
    }
    
    changed(integer change)
    {
        if(change & CHANGED_INVENTORY){
            key note_key = llGetInventoryKey(notecardname);
            if(note_key != notecard_key){
                readed = "";
                state default;
            }
        }
        else if(change & CHANGED_REGION || change & CHANGED_REGION_START){
            llResetScript();
        }
    }
    
    on_rez(integer start_param)
    {
        llReleaseURL(URI);
        request = llRequestURL();
        llSetText(llGetObjectName() + "\n" + llGetObjectDesc(), <1,1,1>, 1.0);
    }
}
