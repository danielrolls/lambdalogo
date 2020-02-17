{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE FlexibleContexts          #-}
{-# LANGUAGE TypeFamilies              #-}

import Diagrams.Prelude
import Diagrams.Backend.Rasterific
import Diagrams.Size (dims)
import Graphics.SVGFonts 

lambda = "\x03BB"

myCircle = circle 0.32 # fc sandybrown 
                       # lc sandybrown

textADot = strutX 0.15 ||| stroke (textSVG' def {mode=INSIDE_W, textWidth=0.3} ("a." <> lambda <> "b.a")) # fc blue 
                                                                                                          # lc blue 
                                                                                                          # rotateBy (1/4)

textLambda :: Diagram B
textLambda = stroke (textSVG' with {mode=INSIDE_WH, textWidth=1, textHeight=1} lambda) # fc blue

main = renderRasterific "lambda.png" 
                        (dims $ V2 500 500)
                        $ textADot <> textLambda <> myCircle

