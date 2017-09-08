default
{
    state_entry()
    {
        llSetText("Get lsl-markdown\non MarcketPlace", <0,1,0>, 0.8);
    }
    
    touch_end(integer index)
    {
        llLoadURL(llDetectedKey(0), "Get lsl-markdown\non MarcketPlace", "https://marketplace.secondlife.com/p/lsl-markdown/10150341");
    }
}
