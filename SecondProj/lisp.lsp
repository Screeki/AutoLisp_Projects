(defun increaseTotalPrice (lst) 
  (setq price (nth 4 lst))
  (setq amount (nth 5 lst))
  (setq totalMeatPrice (+ totalMeatPrice (* price amount)))
)

(defun getEkB () 
  (setq madeIn (open "C:/Ysman/MADE_IN.DAT" 
                     "r"
               )
  )
  (setq russiaString "Russia")
  (setq ekbMeatName "(EKB MEAT)")
  (setq ekbMeatName (read ekbMeatName))
  (setq totalMeatPrice 0)

  (while (setq madeInLine (read-line madeIn)) 
    (setq madeInList (read madeInLine))
    (setq madeInLine (member (nth 2 (read madeInLine)) (read madeInLine)))
    (setq i 0)
    (setq isEquals T)
    (foreach part madeInLine 
      (if (/= part (nth i ekbMeatName)) 
        (setq isEquals nil)
      )
      (setq i (+ i 1))
    )

    (setq goods (open "C:/Ysman/GOODS.DAT" 
                      "r"
                )
    )
    (setq madeInKey (nth 0 madeInList))
    (if isEquals 
      (while (setq goodsLineFile (read-line goods)) 
        (setq goodsList (read goodsLineFile))
        (setq goodsKey (nth 0 goodsList))
        (setq isEquals (= goodsKey madeInKey))
        (if isEquals 
          (increaseTotalPrice goodsList)
        )
      )
    )
    (close goods)
  )

  (princ "Total Meat Price is ")
  (princ totalMeatPrice)

  ;(if (= (ekbMeatName res_factory_name))
  ;  (princ "\n")
  ;)
  (close madeIn)
)

(getEkB)

  ;"суммарную    стоимость    товаров Екатеринбургского  мясокомбината".