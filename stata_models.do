
 use "C:\Users\mxt180013\Downloads\guns.dta"
 
histogram incarc_rate 
histogram pb1064
histogram pw1064
histogram pm1029
histogram pop
histogram avginc 
histogram density 
histogram vio 
histogram rob 
histogram mur 

 
generate log_mur = log(mur) 
generate log_vio = log(vio) 
generate log_pop = log(pop) 
generate log_dens = log(density) 
generate log_rob = log(rob) 
generate log_incar = log(incarc_rate) 
generate log_inc = log(avginc) 

generate d77 = 0 
replace d77 = 1 if year==77 

generate d78 = 0 
replace d78 = 1 if year==78 

generate d79 = 0 
replace d79 = 1 if year==79 

generate d80 = 0 
replace d80 = 1 if year==80

generate d81 = 0 
replace d81 = 1 if year==81

generate d82 = 0 
replace d82 = 1 if year==82

generate d83 = 0 
replace d80 = 1 if year==80

generate d84 = 0 
replace d84 = 1 if year==84

generate d85 = 0 
replace d85 = 1 if year==85

generate d86 = 0 
replace d86 = 1 if year==86

generate d87 = 0 
replace d87 = 1 if year==87

generate d88 = 0 
replace d88 = 1 if year==88

generate d89 = 0 
replace d89 = 1 if year==89

generate d90 = 0 
replace d90 = 1 if year==90

generate d91 = 0 
replace d91 = 1 if year==91

generate d92 = 0 
replace d92 = 1 if year==92

generate d93 = 0 
replace d93 = 1 if year==93

generate d94 = 0 
replace d94 = 1 if year==94

generate d95 = 0 
replace d95 = 1 if year==95

generate d96= 0 
replace d96 = 1 if year==96


generate d97 = 0 
replace d97 = 1 if year==97


generate d98 = 0 
replace d98 = 1 if year==98


generate d99 = 0 
replace d99 = 1 if year==99

*********************** Violence Crime********* 
*** Pooled OLS 
reg log_vio log_incar pb1064 pw1064 pm1029 log_pop log_inc log_dens shall 
estimates store Pooled_OLS_Vio

*** Entitry Fixed Effect 
xtset stateid year 
xtreg log_vio log_incar pb1064 pw1064 pm1029 log_pop log_inc log_dens shall, fe
estimates store Entity_FE_Vio

*** Time Fixed Effect
xtreg log_vio log_incar pb1064 pw1064 pm1029 log_pop log_inc log_dens shall d77 d78 d79 d80 d81 d82 d83 d84 d85 d86 d87 d88 d89 d90 d91 d92 d93 d94 d95 d96 d97 d98 d99, fe
estimates store Time_FE_Vio
test (d77=0) (d78=0) (d79=0) (d80=0) (d81=0) (d82=0) (d83=0) (d84=0) (d85=0) (d86=0) (d87=0) (d88=0) (d89=0) (d90=0) (d91=0) (d92=0) (d93=0) (d94=0) (d95=0) (d96=0) (d97=0) (d98=0) (d99=0) 

estimates table Pooled_OLS_Vio Entity_FE_Vio Time_FE_Vio,varlabel varwidth(25)  b(%6.3f) star(0.05 0.01 0.001) stats(N r2_a)

*** Hausman Test 
xtreg log_vio log_incar pb1064 pw1064 pm1029 log_pop log_inc log_dens shall, re
estimates store Random_Vio

hausman Random_Vio Entity_FE_Vio 


*********************** Robbery Crime********* 
*** Entitry Fixed Effect 
xtset stateid year 
xtreg log_rob log_incar pb1064 pw1064 pm1029 log_pop log_inc log_dens shall, fe
estimates store Entity_FE_Rob 

*** Time Fixed Effect 
xtreg log_rob log_incar pb1064 pw1064 pm1029 log_pop log_inc log_dens shall d77 d78 d79 d80 d81 d82 d83 d84 d85 d86 d87 d88 d89 d90 d91 d92 d93 d94 d95 d96 d97 d98 d99, fe
estimates store Time_FE_Rob
test (d77=0) (d78=0) (d79=0) (d80=0) (d81=0) (d82=0) (d83=0) (d84=0) (d85=0) (d86=0) (d87=0) (d88=0) (d89=0) (d90=0) (d91=0) (d92=0) (d93=0) (d94=0) (d95=0) (d96=0) (d97=0) (d98=0) (d99=0) 

*** Hausman Test 
xtreg log_rob log_incar pb1064 pw1064 pm1029 log_pop log_inc log_dens shall, re
estimates store Random_Rob

 hausman Random_Rob Entity_FE_Rob

estimates table Entity_FE_Rob Time_FE_Rob,varlabel varwidth(25)  b(%6.3f) star(0.05 0.01 0.001) stats(N r2_a)


*********************** Murder Crime********* 
*** Entitry Fixed Effect 
xtset stateid year 
xtreg log_mur log_incar pb1064 pw1064 pm1029 log_pop log_inc log_dens shall, fe
estimates store Entity_FE_Mur 

*** Time Fixed Effect 
xtreg log_mur log_incar pb1064 pw1064 pm1029 log_pop log_inc log_dens shall d77 d78 d79 d80 d81 d82 d83 d84 d85 d86 d87 d88 d89 d90 d91 d92 d93 d94 d95 d96 d97 d98 d99, fe
estimates store Time_FE_Mur
test (d77=0) (d78=0) (d79=0) (d80=0) (d81=0) (d82=0) (d83=0) (d84=0) (d85=0) (d86=0) (d87=0) (d88=0) (d89=0) (d90=0) (d91=0) (d92=0) (d93=0) (d94=0) (d95=0) (d96=0) (d97=0) (d98=0) (d99=0) 


*** Hausman Test 
xtreg log_mur log_incar pb1064 pw1064 pm1029 log_pop log_inc log_dens shall, re
estimates store Random_Mur 

 hausman Random_Mur Entity_FE_Mur

estimates table Entity_FE_Mur Time_FE_Mur,varlabel varwidth(25)  b(%6.3f) star(0.05 0.01 0.001) stats(N r2_a)






