using System.Collections;
using System.Collections.Generic;
using UnityEngine;


public class PlayerCont : MonoBehaviour
{
    public float gravity;
    public float nSpeed;
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        transform.Translate(new Vector3(0f,-gravity * Time.deltaTime, 0f));
        if (Input.GetAxisRaw("Horizontal") > 0.5f || Input.GetAxisRaw("Horizontal") < -0.5f)
        {
            transform.Translate(new Vector3(Input.GetAxisRaw("Horizontal") * nSpeed * Time.deltaTime, 0f, 0f));
        }
    
        if (Input.GetKeyDown(KeyCode.Space))
        {
            print("Jump");
        }
           }
    
}
