(defun PROOF (HYPOTHESIS / RULES RULE LRULES I TFRULES J CONDS LCONDS TFCONDS K ANSWER)
(if (member HYPOTHESIS FACTS) 
    t
      (progn (if (member HYPOTHESIS AFACTS)
    nil
    (progn 
      (setq RULES () LRULES 0 I 0)
    (repeat LBASE          
      (setq RULE (nth I KNOWLEDGE))
      (if (equal HYPOTHESIS (car (nth 1 RULE))) (setq RULES (cons RULE RULES)))
      (setq I (1+ I))
    )
    (cond (RULES (setq LRULES (length RULES) TFRULES nil J -1) 
           ; последовательно доказываются правила из списка RULES
        (while (and (<= (1+ J) (1- LRULES)) (not TFRULES))
          (progn
          (setq J (1+ J))
          (setq RULE (nth J RULES) CONDS (nth 0 RULE))
          (setq LCONDS (length CONDS) TFCONDS t K -1)
          (setq TFRULES (or TFRULES
            ; последовательно доказываются правила из списка CONDS
                         (while (and (<= (1+ K) (1- LCONDS)) (= TFCONDS t))
                (setq K (1+ K)) 
                (setq TFCONDS (and TFCONDS (PROOF(nth K CONDS)) ))
                )))
            ) 
        ))
      (t (initget 1 "y n")
        (setq ANSWER (getkword (strcat HYPOTHESIS "? ")))
    (if (= ANSWER "y") (progn (setq FACTS (cons HYPOTHESIS FACTS)) (prin1) t)
          (progn (setq AFACTS (cons HYPOTHESIS AFACTS)) nil))
        )
                )
         )
    )))
)

(defun KT ( / KNOWLEDGE HYPOTHESIS GOALS LBASE FACTS LGOALS TFGOALS M) 
(setq KNOWLEDGE '(
(
  (
    "Не имеет знаний о другом языке"
    "Знает пару слов" 
  )
  (
    "Уровень владения иностранным языком - Уровень не начавшего."
  ) 
)
(
  (
    "Знает пару слов" 
    "Может спросить дорогу"
  )
  (
    "Уровень владения иностранным языком - Уровень начинающего."
    "Уровень владения иностранным языком - Уровень школьный."
    "Уровень владения иностранным языком - Уровень обучащегося."
    "Уровень владения иностранным языком - Уровень активно обучающегося."
    "Уровень владения иностранным языком - Уровень учителя."
    "Уровень владения иностранным языком - Уровень близкого к репетиторству."
    "Уровень владения иностранным языком - Уровень репетитора."
    "Уровень владения иностранным языком - Уровень наставника."
    "Уровень владения иностранным языком - Уровень руководителя группы обучающих."
    "Уровень владения иностранным языком - Уровень профессионального учителя."
    "Уровень владения иностранным языком - Уровень профессионального меж. странного учителя."
    "Уровень владения иностранным языком - Уровень близкого к профессиональному владению."
    "Уровень владения иностранным языком - Уровень профессионального владения."
    "Уровень владения иностранным языком - Уровень владения в совершенстве."
  ) 
)
(
  (
    "Знает пару слов" 
    "Может разговаривать с носителем"
    "Может спросить дорогу"
  )
  (
    "Уровень владения иностранным языком - Уровень школьный."
    "Уровень владения иностранным языком - Уровень обучащегося."
    "Уровень владения иностранным языком - Уровень активно обучающегося."
    "Уровень владения иностранным языком - Уровень учителя."
    "Уровень владения иностранным языком - Уровень близкого к репетиторству."
    "Уровень владения иностранным языком - Уровень репетитора."
    "Уровень владения иностранным языком - Уровень наставника."
    "Уровень владения иностранным языком - Уровень руководителя группы обучающих."
    "Уровень владения иностранным языком - Уровень профессионального учителя."
    "Уровень владения иностранным языком - Уровень профессионального меж. странного учителя."
    "Уровень владения иностранным языком - Уровень близкого к профессиональному владению."
    "Уровень владения иностранным языком - Уровень профессионального владения."
    "Уровень владения иностранным языком - Уровень владения в совершенстве."
  ) 
)
(
  (
    "Знает пару слов" 
    "Может разговаривать с носителем"
    "Может разговаривать с носителем по телефону"
    "Знает от 1 до 2 языков на достаточном уровне"
    "Может спросить дорогу"
  )
  (
    "Уровень владения иностранным языком - Уровень обучащегося."
    "Уровень владения иностранным языком - Уровень активно обучающегося."
  ) 
)
(
  (
    "Знает пару слов" 
    "Может разговаривать с носителем"
    "Может разговаривать с носителем по телефону"
    "Может поддерживать беседу продолжительное время"
    "Знает от 1 до 2 языков на достаточном уровне"
    "Может спросить дорогу"
  )
  (
    "Уровень владения иностранным языком - Уровень активно обучающегося."
  ) 
)
(
  (
    "Знает пару слов" 
    "Может разговаривать с носителем"
    "Может разговаривать с носителем по телефону"
    "Может поддерживать беседу продолжительное время"
    "Может разговаривать с разными носителями языка"
    "Знает от 3 до 4 языков на хорошем уровне"
    "Может спросить дорогу"
    "Может общаться по скайпу или преподовать"
  )
  (
    "Уровень владения иностранным языком - Уровень учителя."
    "Уровень владения иностранным языком - Уровень близкого к репетиторству."
  ) 
)
(
  (
    "Знает пару слов" 
    "Может разговаривать с носителем"
    "Может разговаривать с носителем по телефону"
    "Может поддерживать беседу продолжительное время"
    "Может разговаривать с разными носителями языка"
    "Знает от 3 до 4 языков на хорошем уровне"
    "Может мыслить на другом языке"
    "Может спросить дорогу"
    "Может общаться по скайпу или преподовать"
  )
  (
    "Уровень владения иностранным языком - Уровень близкого к репетиторству."
  ) 
)
(
  (
    "Знает пару слов" 
    "Может разговаривать с носителем"
    "Может разговаривать с носителем по телефону"
    "Может поддерживать беседу продолжительное время"
    "Может разговаривать с разными носителями языка"
    "Знает от 5 языков на высоком уровне"
    "Может мыслить на другом языке"
    "Активно приминяет свои знания в практике носителем"
    "Умеет проверять(исправлять) граматические и смысловые ошибки"
    "Может спросить дорогу"
    "Может общаться по скайпу или преподовать"
    "Отвечает за общение между двумя носитялями разных языков"
  )
  (
    "Уровень владения иностранным языком - Уровень репетитора."
    "Уровень владения иностранным языком - Уровень наставника."
    "Уровень владения иностранным языком - Уровень руководителя группы обучающих."
  ) 
)
(
  (
    "Знает пару слов" 
    "Может разговаривать с носителем"
    "Может разговаривать с носителем по телефону"
    "Может поддерживать беседу продолжительное время"
    "Может разговаривать с разными носителями языка"
    "Знает от 5 языков на высоком уровне"
    "Может мыслить на другом языке"
    "Активно приминяет свои знания в практике носителем"
    "Умеет обучать и консультировать более низких по уровню знаний людей"
    "Умеет проверять(исправлять) граматические и смысловые ошибки"
    "Может спросить дорогу"
    "Может общаться по скайпу или преподовать"
    "Отвечает за общение между двумя носитялями разных языков"
  )
  (    
    "Уровень владения иностранным языком - Уровень наставника."
    "Уровень владения иностранным языком - Уровень руководителя группы обучающих."
  ) 
)
(
  (
    "Знает пару слов" 
    "Может разговаривать с носителем"
    "Может разговаривать с носителем по телефону"
    "Может поддерживать беседу продолжительное время"
    "Может разговаривать с разными носителями языка"
    "Знает от 5 языков на высоком уровне"
    "Может мыслить на другом языке"
    "Активно приминяет свои знания в практике носителем"
    "Умеет проводить встречи между носителями"
    "Умеет обучать и консультировать более низких по уровню знаний людей"
    "Умеет управлять преподователями разных языков"
    "Умеет проверять(исправлять) граматические и смысловые ошибки"
    "Может спросить дорогу"
    "Может общаться по скайпу или преподовать"
    "Отвечает за общение между двумя носитялями разных языков"
  )
  (    
    "Уровень владения иностранным языком - Уровень руководителя группы обучающих."
  ) 
)
(
  (
    "Знает пару слов" 
    "Может разговаривать с носителем"
    "Может разговаривать с носителем по телефону"
    "Может поддерживать беседу продолжительное время"
    "Может разговаривать с разными носителями языка"
    "Знает от 5 языков на высоком уровне"
    "Может мыслить на другом языке"
    "Активно приминяет свои знания в практике носителем"
    "Умеет проводить встречи между носителями"
    "Умеет встречаться с иностранными заказчиками и договариваться насчёт сделок"
    "Умеет обучать и консультировать более низких по уровню знаний людей"
    "Умеет управлять преподователями разных языков"
    "Умеет проверять(исправлять) граматические и смысловые ошибки"
    "Знает тонкости изучаемых(преподоваемых) языков"
    "Может спросить дорогу"
    "Может общаться по скайпу или преподовать"
  )
  (    
    "Уровень владения иностранным языком - Уровень профессионального учителя."
  ) 
)
(
  (
    "Знает пару слов" 
    "Может разговаривать с носителем"
    "Может разговаривать с носителем по телефону"
    "Может поддерживать беседу продолжительное время"
    "Может разговаривать с разными носителями языка"
    "Знает от 5 языков на высоком уровне"
    "Может мыслить на другом языке"
    "Активно приминяет свои знания в практике носителем"
    "Умеет проводить встречи между носителями"
    "Умеет обучать и консультировать более низких по уровню знаний людей"
    "Умеет управлять преподователями разных языков"
    "Умеет проверять(исправлять) граматические и смысловые ошибки"
    "Активно приминяет свои знания с носителями других языков"  
    "Может спросить дорогу"
    "Может общаться по скайпу или преподовать"
    "Отвечает за эффективность встреч между группой иностранцев"
  )
  (    
    "Уровень владения иностранным языком - Уровень профессионального меж. странного учителя."
  ) 
)
(
  (
    "Знает пару слов" 
    "Может разговаривать с носителем"
    "Может разговаривать с носителем по телефону"
    "Может поддерживать беседу продолжительное время"
    "Может разговаривать с разными носителями языка"
    "Знает от 5 языков на высоком уровне"
    "Может мыслить на другом языке"
    "Активно приминяет свои знания в практике носителем"
    "Умеет проводить встречи между носителями"
    "Отвечает за эффективность встреч между иностранными политиками"
    "Умеет обучать и консультировать более низких по уровню знаний людей"
    "Умеет управлять преподователями разных языков"
    "Умеет проверять(исправлять) граматические и смысловые ошибки"    
    "Может спросить дорогу"
    "Может общаться по скайпу или преподовать"    
  )
  (    
    "Уровень владения иностранным языком - Уровень близкого к профессиональному владению."
  ) 
)
(
  (
    "Знает пару слов" 
    "Может разговаривать с носителем"
    "Может разговаривать с носителем по телефону"
    "Может поддерживать беседу продолжительное время"
    "Может разговаривать с разными носителями языка"
    "Знает от 5 языков на высоком уровне"
    "Может мыслить на другом языке"
    "Активно приминяет свои знания в практике носителем"
    "Умеет проводить встречи между носителями"    
    "Умеет обучать и консультировать более низких по уровню знаний людей"
    "Умеет управлять преподователями разных языков"
    "Умеет проверять(исправлять) граматические и смысловые ошибки"    
    "Может спросить дорогу"
    "Может общаться по скайпу или преподовать"   
    "Объединяет иностранных людей из разных компаний для достижения поставленных компанией целей"
    "Определяет уровень знаний других лингвистов" 
  )
  (    
    "Уровень владения иностранным языком - Уровень профессионального владения."
  ) 
)
(
  (
    "Знает пару слов" 
    "Может разговаривать с носителем"
    "Может разговаривать с носителем по телефону"
    "Может поддерживать беседу продолжительное время"
    "Может разговаривать с разными носителями языка"
    "Знает от 5 языков на высоком уровне"
    "Может мыслить на другом языке"
    "Активно приминяет свои знания в практике носителем"
    "Умеет проводить встречи между носителями"    
    "Умеет обучать и консультировать более низких по уровню знаний людей"
    "Умеет управлять преподователями разных языков"
    "Умеет проверять(исправлять) граматические и смысловые ошибки"    
    "Может спросить дорогу"
    "Может общаться по скайпу или преподовать"   
    "Улучшает взаимодействие между разными компаниями или политиками"
  )
  (    
    "Уровень владения иностранным языком - Уровень владения в совершенстве."
  ) 
)
; NEW
(
  (
    "Умеет встречаться с иностранными заказчиками и договариваться насчёт сделок"
  )
  (    
    "Умеет проводить встречи между носителями"
  ) 
)
(
  (
    "Умеет управлять преподователями разных языков"
  )
  (    
    "Умеет обучать и консультировать более низких по уровню знаний людей"
  ) 
)
(
  (
    "Активно приминяет свои знания в практике носителем"
  )
  (    
    "Может мыслить на другом языке"
    "Может разговаривать с разными носителями языка"
    "Может поддерживать беседу продолжительное время"
    "Может разговаривать с носителем по телефону"
    "Может разговаривать с носителем"
    "Знает пару слов" 
    "Может спросить дорогу"
    "Может общаться по скайпу или преподовать"
  ) 
)
(
  (
    "Знает от 5 языков на высоком уровне"
  )
  (    
    "Может мыслить на другом языке"
    "Может разговаривать с разными носителями языка"
    "Может поддерживать беседу продолжительное время"
    "Может разговаривать с носителем по телефону"
    "Может разговаривать с носителем"
    "Знает пару слов" 
    "Может спросить дорогу"
    "Может общаться по скайпу или преподовать"
  ) 
)
(
  (
    "Отвечает за эффективность встреч между группой иностранцев"
  )
  (    
    "Знает от 5 языков на высоком уровне"
  ) 
)
(
  (
    "Умеет управлять преподователями разных языков"
  )
  (    
    "Знает от 5 языков на высоком уровне"
  ) 
)
(
  (
    "Может мыслить на другом языке"
  )
  (    
    "Может разговаривать с разными носителями языка"
    "Может поддерживать беседу продолжительное время"
    "Может разговаривать с носителем по телефону"
    "Может разговаривать с носителем"
    "Знает пару слов" 
    "Может спросить дорогу"
    "Может общаться по скайпу или преподовать"
  ) 
)
(
  (
    "Может разговаривать с разными носителями языка"
  )
  (        
    "Может поддерживать беседу продолжительное время"
    "Может разговаривать с носителем по телефону"
    "Может разговаривать с носителем"
    "Знает пару слов" 
    "Может спросить дорогу"
    "Может общаться по скайпу или преподовать"
  ) 
)
(
  (
    "Может поддерживать беседу продолжительное время"
  )
  (            
    "Может разговаривать с носителем по телефону"
    "Может разговаривать с носителем"
    "Знает пару слов" 
    "Может спросить дорогу"    
  ) 
)
(
  (
    "Может разговаривать с носителем по телефону"
  )
  (            
  
    "Может разговаривать с носителем"
    "Знает пару слов" 
    "Может спросить дорогу"    
  ) 
)
(
  (
    "Может разговаривать с носителем"
  )
  (            
    "Знает пару слов" 
    "Может спросить дорогу"
  ) 
)
(
  (
    "Знает пару слов" 
  )
  (            
    "Может спросить дорогу"
  ) 
)
(
  (
    "Может общаться по скайпу или преподовать"
  )
  (            
    "Знает пару слов"
    "Может разговаривать с разными носителями языка"
    "Может поддерживать беседу продолжительное время"
    "Может разговаривать с носителем по телефону"
    "Может разговаривать с носителем"
    "Может спросить дорогу"
  ) 
)
(
  (
    "Знает от 3 до 4 языков на хорошем уровне"
  )
  (            
    "Знает пару слов"
    "Может разговаривать с носителем"
    "Может разговаривать с носителем по телефону"
    "Может поддерживать беседу продолжительное время"
    "Может разговаривать с разными носителями языка"
    "Может спросить дорогу"
    "Может общаться по скайпу или преподовать"
  ) 
)
(
  (
    "Знает от 1 до 2 языков на достаточном уровне"
  )
  (            
    "Знает пару слов"
    "Может разговаривать с носителем"
    "Может разговаривать с носителем по телефону"
    "Может спросить дорогу"
  ) 
)
(
  (
    "Умеет проверять(исправлять) граматические и смысловые ошибки"
  )
  (            
    "Активно приминяет свои знания в практике носителем"
    "Знает от 5 языков на высоком уровне"
  ) 
)
(
  (
    "Может спросить дорогу"
  )
  (            
    "Знает пару слов" 
  ) 
)
(
  (
    "Может общаться по скайпу или преподовать"
  )
  (            
    "Может спросить дорогу"
    "Может поддерживать беседу продолжительное время"
    "Может разговаривать с носителем по телефону"
    "Может разговаривать с носителем"    
    "Знает пару слов" 
  ) 
)
(
  (
    "Отвечает за общение между двумя носитялями разных языков"
  )
  ( 
    "Может общаться по скайпу или преподовать"           
    "Может спросить дорогу"
    "Умеет проверять(исправлять) граматические и смысловые ошибки"
    "Активно приминяет свои знания в практике носителем"
    "Знает от 5 языков на высоком уровне"
    "Может разговаривать с разными носителями языка"
    "Может мыслить на другом языке"
    "Может поддерживать беседу продолжительное время"
    "Может разговаривать с носителем по телефону"
    "Может разговаривать с носителем"
    "Знает пару слов" 

  ) 
)
(
  (
    "Определяет уровень знаний других лингвистов" 
  )
  ( 
    "Объединяет иностранных людей из разных компаний для достижения поставленных компанией целей"
    "Может общаться по скайпу или преподовать"           
    "Может спросить дорогу"
    "Умеет проверять(исправлять) граматические и смысловые ошибки"
    "Активно приминяет свои знания в практике носителем"
    "Знает от 5 языков на высоком уровне"
    "Может разговаривать с разными носителями языка"
    "Может мыслить на другом языке"
    "Может поддерживать беседу продолжительное время"
    "Может разговаривать с носителем по телефону"
    "Может разговаривать с носителем"
    "Знает пару слов" 

  ) 
)
(
  (
    "Улучшает взаимодействие между разными компаниями или политиками" 
  )
  (     
    "Может общаться по скайпу или преподовать"           
    "Может спросить дорогу"
    "Умеет проверять(исправлять) граматические и смысловые ошибки"
    "Активно приминяет свои знания в практике носителем"
    "Знает от 5 языков на высоком уровне"
    "Может разговаривать с разными носителями языка"
    "Может мыслить на другом языке"
    "Может поддерживать беседу продолжительное время"
    "Может разговаривать с носителем по телефону"
    "Может разговаривать с носителем"
    "Знает пару слов" 

  ) 
)
(
  (    
    "Активно приминяет свои знания с носителями других языков" 
  )
  (     
    "Может общаться по скайпу или преподовать"           
    "Может спросить дорогу"
    "Умеет проверять(исправлять) граматические и смысловые ошибки"
    "Активно приминяет свои знания в практике носителем"
    "Знает от 5 языков на высоком уровне"
    "Может разговаривать с разными носителями языка"
    "Может мыслить на другом языке"
    "Может поддерживать беседу продолжительное время"
    "Может разговаривать с носителем по телефону"
    "Может разговаривать с носителем"
    "Знает пару слов" 

  ) 
)
(
  (
    "Знает тонкости изучаемых(преподоваемых) языков"    
  )
  (     
    "Может общаться по скайпу или преподовать"           
    "Может спросить дорогу"
    "Умеет проверять(исправлять) граматические и смысловые ошибки"
    "Активно приминяет свои знания в практике носителем"
    "Знает от 5 языков на высоком уровне"
    "Может разговаривать с разными носителями языка"
    "Может мыслить на другом языке"
    "Может поддерживать беседу продолжительное время"
    "Может разговаривать с носителем по телефону"
    "Может разговаривать с носителем"
    "Знает пару слов" 

  ) 
)
(
  (
    "Отвечает за эффективность встреч между иностранными политиками"
  )
  (     
    "Может общаться по скайпу или преподовать"           
    "Может спросить дорогу"
    "Умеет проверять(исправлять) граматические и смысловые ошибки"
    "Активно приминяет свои знания в практике носителем"
    "Знает от 5 языков на высоком уровне"
    "Может разговаривать с разными носителями языка"
    "Может мыслить на другом языке"
    "Может поддерживать беседу продолжительное время"
    "Может разговаривать с носителем по телефону"
    "Может разговаривать с носителем"
    "Знает пару слов" 
  ) 
)
 )) 
  (setq AFACTS () FACTS () ) 
  (setq GOALS '(   
"Уровень владения иностранным языком - Уровень владения в совершенстве."
"Уровень владения иностранным языком - Уровень профессионального владения."
"Уровень владения иностранным языком - Уровень близкого к профессиональному владению."
"Уровень владения иностранным языком - Уровень профессионального меж. странного учителя."
"Уровень владения иностранным языком - Уровень профессионального учителя."
"Уровень владения иностранным языком - Уровень руководителя группы обучающих."
"Уровень владения иностранным языком - Уровень наставника."
"Уровень владения иностранным языком - Уровень репетитора."
"Уровень владения иностранным языком - Уровень близкого к репетиторству."
"Уровень владения иностранным языком - Уровень учителя."
"Уровень владения иностранным языком - Уровень активно обучающегося."
"Уровень владения иностранным языком - Уровень обучащегося."
"Уровень владения иностранным языком - Уровень школьный."
"Уровень владения иностранным языком - Уровень начинающего."                
"Уровень владения иностранным языком - Уровень не начавшего."
))
  (setq LBASE (length KNOWLEDGE) ; число правил в базе знаний
  LGOALS (length GOALS)) ; число разрешённых начальных целей
  (setq M -1 ; переменная индексирования целей
  
TFGOALS nil) ; TFGOALS имеет значение nil, если ни одна из разрешённых целей не доказана, иначе - значение TFGOALS есть t
  (while (and (<=  (1+ M)  (1- LGOALS)) (not TFGOALS))
       (setq M (1+ M))
   (setq TFGOALS (or TFGOALS (PROOF (nth M GOALS)))) 
  )
  (if TFGOALS
    (print (strcat "  " (nth M GOALS) "  "))
    (print "Извините, я не могу вам помочь!")
  )
(prin1)
)
  (KT)