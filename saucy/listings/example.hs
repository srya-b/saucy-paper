pidsT <- partition honest
pidsF <- honest \\ pidsT

estToT <- intersectM (estTrue 1) (byReceivers pidsT)
estToF <- intersectM (estFalse 1) (byReceivers pidsF)
deliver (estTtoT ++ estFtoF)

forM [1..rounds] $ \r -> do
  partition <- subset honest
  forM partition $ \p -> 
    (intersectM (byReceiver p) (arbitraryEst 1)) >>= deliver

  (cruptEstMsg partition inputs r 5) >>= execCmd . shuffleM 

  cruptAuxs <- cruptAuxMsg honest inputs r 5
  auxs <- allAuxs r
  shuffleM (auxs ++ cruptAuxs) >>= execCmd 

  allEsts r >>= execCmd . shuffleM
