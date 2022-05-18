{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE FlexibleContexts          #-}
{-# LANGUAGE TypeFamilies              #-}

import Diagrams.Prelude
import Diagrams.Backend.Rasterific
import Diagrams.Size (dims)
import Graphics.SVGFonts 


lambda = "\x03BB"

greenCircle = circle 0.32 # greenCentreFadingToWhite
                          # lc white
  where greenCentreFadingToWhite = fillTexture $ mkRadialGradient (mkStops [(lightgreen,0,1), (white,1,1)])
                                                                  (0 ^& 0) 0.30
                                                                  (0 ^& 0) 0.32
                                                                  GradPad

lambdaCalculusText = strutX 0.15 
                       |||
                     stroke (textSVG' def 
                                      {mode=INSIDE_W, textWidth=0.35}
                                      ("a." <> lambda <> "b.a"))
                        # fc silver 
                        # lc silver 
                        # rotateBy (1/4)

bigLambda = stroke (textSVG' with {mode=INSIDE_WH, textWidth=1, textHeight=1} lambda)
               # fc silver
               # lc silver

logo :: Diagram B
logo = lambdaCalculusText
       <> bigLambda
       <> greenCircle # translateY (-0.015)

main = renderRasterific "lambda.png" 
                        (dims $ V2 500 500)
                        logo

