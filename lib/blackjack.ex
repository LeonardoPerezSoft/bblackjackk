defmodule Blackjack do



  @cartas [

    "A de corazones", "A de diamantes", "A de treboles", "A de picas",
    "2 de corazones", "2 de diamantes", "2 de treboles", "2 de picas",
    "3 de corazones", "3 de diamantes", "3 de treboles", "3 de picas",
    "4 de corazones", "4 de diamantes", "4 de treboles", "4 de picas",
    "5 de corazones", "5 de diamantes", "5 de treboles", "5 de picas",
    "6 de corazones", "6 de diamantes", "6 de treboles", "6 de picas",
    "7 de corazones", "7 de diamantes", "7 de treboles", "7 de picas",
    "8 de corazones", "8 de diamantes", "8 de treboles", "8 de picas",
    "9 de corazones", "9 de diamantes", "9 de treboles", "9 de picas",
    "10 de corazones", "10 de diamantes", "10 de treboles", "10 de picas",
    "J de corazones", "J de diamantes", "J de treboles", "J de picas",
    "Q de corazones", "Q de diamantes", "Q de treboles", "Q de picas",
    "K de corazones", "K de diamantes", "K de treboles", "K de picas",
  ]



  def inicio do


    IO.puts("")
    IO.puts("")
    IO.puts("--------------------------------------------------------------------------------------------------------------------------------")
    IO.puts([0x03, 0x05, 0x06, 0x04, 0x03, 0x05, 0x06, 0x04, 0x03, 0x05, 0x06, 0x04, 0x03, 0x05, 0x06, 0x04, 0x03, 0x05, 0x06, 0x04])
    IO.puts("--------------------------------------------BlackJack en Elixir----------------------------------------------------------------")
    IO.puts([0x03, 0x05, 0x06, 0x04, 0x03, 0x05, 0x06, 0x04, 0x03, 0x05, 0x06, 0x04, 0x03, 0x05, 0x06, 0x04, 0x03, 0x05, 0x06, 0x04])
    :timer.sleep(3000)

   # valor_de_carta(A)
   barajar()
   #juego()
  end


  def barajar() do

    baraja = Enum.shuffle(@cartas)

    mano_jugador=[Enum.at(baraja, 0), Enum.at(baraja,1)]
    mano_maquina=[Enum.at(baraja, 2), Enum.at(baraja,3)]



   IO.puts("")
   IO.puts("----------------------------manos-------------------------------------------")
   IO.puts("Mano Jugador : #{inspect(mano_jugador)}")
   IO.puts("Mano Maquina : #{inspect(mano_maquina)}")
   IO.puts("------------------------------------------------------------------------")
   IO.puts("")



    arreglo_jugador = mano_jugador |> Enum.map(&String.first/1)
    arreglo_maquina = mano_maquina |> Enum.map(&String.first/1)

    # IO.inspect(arreglo_maquina)




    #jugador_as = Enum.filter(arreglo_jugador, fn {char1, char2} -> char1 == "A" or char2 == "A" end)
    #maquina_as = Enum.filter(arreglo_maquina, fn {char1, char2} -> char1 == "A" or char2 == "A" end)






    encontrar_as(arreglo_jugador, arreglo_maquina)
    #otraronda(mano_jugador, mano_maquina)





    #as(jugador_as, maquina_as)



  end









  def encontrar_as(arreglo_jugador, arreglo_maquina)  do

    encuentra_as = "A"
    jugador_as =Enum.member?(arreglo_jugador, encuentra_as)
    maquina_as =Enum.member?(arreglo_maquina, encuentra_as)

        puntaje(arreglo_jugador, arreglo_maquina, jugador_as, maquina_as)




    #IO.inspect(jugador_as)
    #IO.inspect(maquina_as)
  end


  def puntaje(arreglo_jugador, arreglo_maquina, jugador_as, maquina_as) do


    valores =%{

      "A" => 1,
      "2" => 2,
      "3" => 3,
      "4" => 4,
      "5" => 5,
      "6" => 6,
      "7" => 7,
      "8" => 8,
      "9" => 9,
      "10" => 10,
       "J" => 10,
       "Q" => 10,
       "K" => 10,

    }


    puntuacion_jugador= arreglo_jugador |> Enum.map(&Map.get(valores, &1, 0)) |> Enum.sum()
    puntuacion_maquina= arreglo_maquina |> Enum.map(&Map.get(valores, &1, 0)) |> Enum.sum()



    IO.puts("----------------------------Puntuaciones de esta ronda-----------------------")
    IO.puts("La puntuacion del jugador #{puntuacion_jugador}")
    IO.puts("La puntuacion de la maquina #{puntuacion_maquina}")
    IO.puts("-----------------------------------------------------------------------------")



    #nuevaronda()



  end










end
