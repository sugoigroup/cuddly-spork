using System.Collections;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using UnityEngine;

public class PluginTest : MonoBehaviour
{
#if UNITY_IOS
	[DllImport("__Internal")]
    private static extern double IOSgetElapsedTime();
#endif
    // Start is called before the first frame update
    void Start()
    {
        Debug.Log("Elapsed" + getElapsedTime());
    }

    int frameCounter = 0;
    // Update is called once per frame
    void Update()
    {
        frameCounter++;
        if (frameCounter >= 5) {
        	Debug.Log("Tick" + getElapsedTime());
        	frameCounter = 0;
        }
    }

    double getElapsedTime() {
    	if (Application.platform == RuntimePlatform.IPhonePlayer) 
    	   return IOSgetElapsedTime();
    	return 0;
    }
}
