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

## TUTORIAL 6
Jadi untuk mengerjakan fitur tombol kembali ke menu utama setelah game over cukup mudah, saya hanya perlu menambahkan linkbutton pada scene game over dan memberikan kode yang ketika event button trsebut di klik akan berpindah ke scene ```MainMenu```.
Lalu untuk fitur select stage, pertama saya memerlukan scene tersebut terlebih dahulu. Sehingga saya bentuk scene dengan hierarki seperti berikut
![image](https://github.com/KenKomKom/gamedev-tutorial-4/assets/119410845/65d6e4db-196c-4a10-9b1b-d24e3288ccd6)

Untuk menghubungkan level selection ke main menu, sama seperti fitur kembali ke MainMenu, saya hanya perlu menambahkan kode pada linkbutton yang sebelumnya sudah dibuat di MainMenu agar berpindah scene ketika terdapat event pressed.
Kode tersebut saya taruh di script bernama linkbutton.gd yang berisikan semua kode untuk transisi scene via button. Berikut contoh cuplikan kode nya
```
func _on_ToLevelSelect_pressed():
	get_tree().change_scene(str("res://scenes/" + scene + ".tscn"))
```

Lalu diminta untuk membuat transition antar scene. Maka saya membuat file global bernama transition yang memiliki kode seperti berikut
```
extends CanvasLayer

onready var animplyer = $AnimationPlayer
onready var label = $MarginContainer/Label

func change_scene(scene, message):
	visible=true
	animplyer.play("fadeto")
	label.text = message
	yield(animplyer,"animation_finished")
	get_tree().change_scene(str("res://scenes/" + scene + ".tscn"))
	animplyer.play_backwards("fadeto")
	yield(animplyer,"animation_finished")
	
	visible=false

func fast_change_scene(scene, message):
	visible=true
	animplyer.play("fadetoshort")
	label.text = message
	yield(animplyer,"animation_finished")
	get_tree().change_scene(str("res://scenes/" + scene + ".tscn"))
	animplyer.play_backwards("fadetoshort")
	yield(animplyer,"animation_finished")
	
	visible=false
```
perbedaan function change_scene dan fast_change_scene hanyalah durasi dari animasi fade to black nya. Dengan memanfaatkan fitur ini, kode kode tadi yang berfungsi untuk berpindah scene, seperti menggunakan button atau mati terkena ikan saya ubah semua menjadi menggunakan 
```
Transition.change_scene(scene_to_load, "<message placeholder>")
```
agar feel dari game lebih finished

Lalu for fun, aku menambahkan label pada tiap level yang memberi tahukan player level berapa Ia berada sekarang menggunakan margincontainer dan label seperti life counter.
