Pada awalnya saya membuat scene baru pada bernama Level2. Lalu saya masukan scene-scene berikut:
- player
- spawner
- area2D (wintrigger)
- area2D (losetrigger)
- sprite (untuk win trigger)
- tilemap
lose trigger saya ubah scenename nya menjadi LoseScreen dan wintrigger saya ubah juga scenename-nya menjadi WinScene

setelah itu tilemap saya berikan collision sehingga player tidak jatuh
kemudian saya buat scene baru bernama ```pinkikan``` yang memiliki nodes:
- sprite
- timer
- area2D (trigger untuk kill player)
  - collision2D
- collision2D
area2D tersebut saya connect signal body enter ke program pinkikan sehingga akan memproses change scene ketika contact dengan player.
setelah itu saya masukan pinkikan ke level2 sebagai obstacle yang di instantiate spawner.
Pink ikan memiliki kode :
```
extends RigidBody2D
func _on_Timer_timeout():
	queue_free()
```
