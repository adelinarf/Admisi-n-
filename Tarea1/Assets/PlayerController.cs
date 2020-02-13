using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerController : MonoBehaviour
{
    public float moveSpeed = 5f; //Velocidad a la que se mueve


    // Start is called before the first frame update
    void Start()
    {
        Physics2D.gravity = Vector2.zero; 
        //Physics2D.gravity = new Vector2(0f, 0.1f);
    }

    // Update is called once per frame
    void Update()
    {
        Vector3 movement = new Vector3(Input.GetAxis("Horizontal"), Input.GetAxis("Vertical"),0f);  // Se genera un vector de movimiento que recibe un input del teclado cuando se presionan las teclas direccionales o wasd
        transform.position += movement * Time.deltaTime * moveSpeed; //Se calcula la posicion y time delta time mide el tiempo desde que se inicia el movimiento con el input 
        transform.position = new Vector3(Mathf.Clamp(transform.position.x, -11.30f, 11.8f), Mathf.Clamp(transform.position.y, -3.33f, 3.54f),0f); //Mathf.Clamp restringe los valores de posicion del player dentro de la pantalla tanto en x como y 
    }
}
