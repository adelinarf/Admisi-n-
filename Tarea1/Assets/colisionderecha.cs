using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class colisionderecha : MonoBehaviour
{
    GameObject Player;
    // Start is called before the first frame update
    void Start()
    {
        Player = gameObject.transform.parent.gameObject;
    }

    // Update is called once per frame
    void Update()
    {

    }

    private void OnCollisionEnter2D(Collision2D collision)
    {
        if (collision.collider.tag == "Colisionder")
        {
            Vector3 movement = new Vector3(-Input.GetAxis("Horizontal"), Input.GetAxis("Vertical"), 0f);

        }
        if (collision.collider.tag == "Colisioniz")
        {
            Vector3 movement = new Vector3(Input.GetAxis("Horizontal")+1, Input.GetAxis("Vertical"), 0f);

        }
        if (collision.collider.tag == "Colisionsup")
        {
            Vector3 movement = new Vector3(Input.GetAxis("Horizontal")+1, Input.GetAxis("Vertical"), 0f);

        }
        if (collision.collider.tag == "Colisioninf")
        {
            Vector3 movement = new Vector3(-Input.GetAxis("Horizontal")+1, Input.GetAxis("Vertical"), 0f);

        }

    }
}

