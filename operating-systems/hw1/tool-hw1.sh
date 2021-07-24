#!/bin/bash


#################################################################
# Konstantinos Bourantas 6145                                   #
# A.M:6145                                                      #                                                            
#                                                               #
#################################################################

 ################################################################################################################################################################################################

function file_opt() {


     IFS=$'|\n' GLOBIGNORE='*' command eval  'XYZ=($(cat $1))' #dimiourgia pinaka me kathe leksi tin opoia periexei to arxeio mas prokeimenou na xrisimopoiithei stis sinartiseis born-until kai since.

     file_path=$1; #apothikeusi tou path tou arxeiou to opoio anoigoume
     

 }


 ################################################################################################################################################################################################

function search_opt(){

     awk -v id=$1 'BEGIN {FS=OFS="|"} { if ($1==id) printf "%s %s %s\n", $3, $2 , $5 }' $file_path;
     #vrisimopoioume tin awk gia na psaksoume to epithimito id sto arxeio. Apothikeuoume tin timi pou orizei o xristis stin metavliti id i opoia pernaei
     #stin awk kai epeita saronoume to arxeio gia na entopisoume to sigkekrimeno id. Molis ot vroume ektiponoume ta analoga pedia diladi onoma eponima imerominia gennisis.
    
 }

 ################################################################################################################################################################################################
function fname_sort(){

     awk 'BEGIN {FS=OFS="|"} { print $3 }' $file_path |sort # |uniq #ektiponoume ola ta prota onomata taksinomimena me tin xrisi tis awk,
     # i parametros $3 simenei oti  psaxnoume sto 3o xorismeno me "|" pedio mesa sto arxeio
 }

 ################################################################################################################################################################################################

function lname_sort(){

     awk 'BEGIN {FS=OFS="|"} { print $2 }' $file_path |sort # |uniq #ektiponoume ola ta prota onomata taksinomimena me tin xrisi tis awk,
     # i parametros $3 simenei oti  psaxnoume sto 3o xorismeno me "|" pedio mesa sto arxeio

 }

 ################################################################################################################################################################################################

function edit_sh(){
     
     if [ $2 -lt 2 ] || [ $2 -gt 8 ] ; then exit 1; fi  #elegxoume na min exoun kseperastei ta oria pou exoume orisei sta arxeio mas
                                                        #ean o xristis valei lanthosmeni stili tote to script termatizei
     awk -v id=$1 -v c=$2 -v val=$3 'BEGIN {FS=OFS="|"} { if ($1==id) $c = val }1' $file_path  > _file.tmp && mv _file.tmp $file_path
     # orizoume to id to opoio psaxnoume id , tin stili c pou tha antikatastisoume tin timi , kai tin timi antikatastasis v 
     #epeita eksagoume to apotelesma tis awk se ena temp file kai epeita antigrafoume to temp file sto kirio mas arxeio.
 }

 ################################################################################################################################################################################################


function browsers(){
	 #kaloume tis sinartiseis egrep kai awk. Me tin egrep vriskoume kathe leksi kai epeita xrisimopoiioume tin dinatotia 
     #tis awk na xrisimopoiei os index tis idies tis lekseis kai metrame tin sixnotita kathe leksis. Telos ektiponoume tous browsers
     #kai tis sixnotites tous.
     filename=$file_path;
     egrep -o "\b[[:alpha:]]+\b" $filename | \
     awk '{ count[$0]++ }
     END{
     printf("%s %d\n","Firefox",count["Firefox"]);
     printf("%s %d\n","Chrome",count["Chrome"]);
     printf("%s %d\n","Safari",count["Safari"]);
     printf("%s %d\n","Opera",count["Opera"]);
     printf("%s %d\n","Internet Explorer",count["Internet"]); 
     }' | sort

 }



 ################################################################################################################################################################################################

function born_since(){

 count=12; #omoiws me tin born_until()
 line_count=2;
 


 while [[  $count -le ${#XYZ[@]} ]]; do
     
     cmp_date=$(echo ${XYZ[count]} | tr -d '-');
     since_date=$(echo $1 | tr -d '-');

     if [ "$until_bool" == "True" ]; then #edw to script xeirizetai tin periptosi pou i born-since kai born-until klithikan sindiastika

         if [[ $cmp_date -ge $since_date  &&  $cmp_date -le $until_date ]]; then 
         
                 awk 'NR == n {print;}' n=$line_count $file_path #omoiws me tin born_until()
         fi
     
         
     else 

     	 if [[ $cmp_date -ge $since_date ]]; then

     	 	     awk 'NR == n {print;}' n=$line_count $file_path #omoiws me tin born_until()
         fi

     fi 


         let "count=count+8"; #omoiws me tin born_until()
         let "line_count=line_count+1"; #omoiws me tin born_until()


 done

 }

  ################################################################################################################################################################################################

 function born_until(){
 
 count=12; #dixnei stin proti imerominia tou arxeio epeita tin auksanoume kata 8 etsi oste stin epomeni epanalipsi na maste pali se thesi pou periexei imerominia .
           # gia tin parakatw ilopoiisi exei xrisimopoiithei pinakas pou periexei kathe leksi tou arxeiou

 line_count=2; #i metavliti line_count apothikeuei se pia grammi vriskomaste se kathe epanalipsi tis while.
 #i sinartisi born_until() tha ektiposei apotelesma mono stin periptosi pou exei kalestei moni tis.

 while [[  $count -le ${#XYZ[@]} ]]; do
     
     #metatrepoume tis imerominies me formati px. 1980-06-10 se 19800610 etsi oste na mporoume na tis sigkrinoume.
     cmp_date=$(echo ${XYZ[count]} | tr -d '-'); #i imerominia pou pernoume apo to arxeio 
     until_date=$(echo $1 | tr -d '-'); #i imerominia pou exei dosei o xristis.

     if [ "$since_bool" == "False" ]; then #ean o xristis den exei sindiasei tis born-since kai born-until


         if [[ $cmp_date -le $until_date ]]; then 
         
             awk 'NR == n {print;}' n=$line_count $file_path #xrisi tis awk gia ektiposi tis epithimitis grammis tou arxeiou
         fi

         
         let "line_count=line_count+1"; # auksisi tou metriti thesis twn grammwn tou arxeiou
     fi

     let "count=count+8"; #pigene stn epomeni imerominia

 done 


 until_bool="True"; #enimerose to flag tis born_until oti i sinartisi etrekse.


 }



 ################################################################################################################################################################################################

# Metatropi twn megalwn onomatwn twn parametrwn se monous xaraktires kathws i sinartisi getopts() den dexetai polisilaves eisodous.

for arg in "$@"; do
  shift
  case "$arg" in
    
    "-id") set -- "$@" "-i" ;;
    "--firstnames")   set -- "$@" "-n" ;;
    "--lastnames")   set -- "$@" "-l" ;;
    "--edit")   set -- "$@" "-h" ;;
    "--born-since") set -- "$@" "-s";;
    "--born-until") set -- "$@" "-u";;
    "--browsers") set -- "$@" "-b";;
    *)        set -- "$@" "$arg";;
  esac
done


# Xrisimopoiime alles 3 while opos vlepoume parakatw gia na kalipsoume kathe
# dinato sindiasmo pou mporei o xristis na dwsei tis entoles sto script.


OPTIND=1

while getopts ":i:f:nls:u:bh:" opt; #psaxnoume prota oles tis eisodous etsi oste na vroume proto to filepath to opoio einai aparaitito na vrethei proto se kathe periptosi .
do
  case $opt in
    
    f) file_opt $OPTARG ;;
     
  esac
 
done


OPTIND=1 # i metavliti auti mas dixnei tin thesi tou epomenou se seira argument to opoio tha diavasei i getopts().
         #to epanaferoume stin timi 1 kathe fora pou teleiwnei mia apo tis treis voithitikes while() etsi oste na dixnei stin proti mas eisodo kai pali.

since_bool="False"; #tin since_bool tin xrisimopoioume etsi oste na enimerosoume to script oti tha kalestei i sinartisi born_since 
                    #mas xrisimeuei oti o xristis treksei tis entoles born-since kai until tautoxrona.


while getopts ":i:f:nls:u:bh:" opt;
do
  case $opt in
    
    s) since_bool="True";;
     
  esac
 
done



OPTIND=1


#edw pali trexoume mia while etsi oste na entopisoume , an iparxei i born_until() kai na tin  treksoume  
#psaxnoume prota na vroume an kalestike i born_until etsi oste stin sinexeia na perasoume tin metavliti until_bool stin sinartisi born_since i opoia
#periexe kai tin sindiastiki leitourgia twn dio diladi oti kalesoume kai tin born_until() kai born_since() i born_since() einai auti i opoia tha ektiposei to apotelesma.
#otan exoume kalesei kai tis dio i born_until den ektiponei tipota paramono orizei tin timi tis until_bool.

while getopts ":i:f:nls:u:bh:" opt;
do
  case $opt in
    
    u) born_until $OPTARG ;;
    
     
  esac
 
done

OPTIND=1

#metepeita afou vevaithoume gia tis sinartisi file_opt() kai born_until()-since() oi opoies apaitoun idietero xeirismo 
#koitame gia oles tis ipoloipes entoles tou script.

while getopts ":i:f:nls:u:bh:" opt; #Gia ton xeirismo twn leitourgiwn tou script xrisimopoiithike i sinartisi getopts()
do
  case $opt in #h metavliti OPTARG mas dinei tin eisodo stin kathe entoli pou diavazei i getopts().

    i) search_opt $OPTARG;; #kalesma tis leitourgias anazitisis sto arxeio me vasi kapoio id pou dinetai apo ton xristi.
    n) fname_sort ;; #ektiposi olwn twn diakritwn onomatwn pou periexei to arxeio , me taksinomisi
    l) lname_sort ;; #ektiposi olwn twn diakritwn eponimwn pou periexei to arxeio,  me taksinomisi
    h) 
       

      if [ "$1" ==  "-f" ] 
      then 
             edit_sh $4 $5 $6 #kalesma tis leitourgias edit() pou epeksergazetai to arxeio .
       else
       	     

       	     file_path=$6;                                                                                     
       	     edit_sh $2 $3 $4       
        fi ;;
    s) born_since $OPTARG;; #ektiposi olwn twn prosopwn pou exoun genithei meta apo mia orismeni imerominia.
    #u) born_until $OPTARG;;
    b) browsers ;; #ektiposi olwn twn browsers me alfavitiki seira kai tou arithmou twn atomwn pou xrisimopoiioun ton kathena.
    \?) echo "Invalid opt"; exit 1;; #ektiposi minimatos lathous otan o xristis pliktrologisei lathos entoles.
    :) echo "need argument"; exit 1;; #ektiposi minimatos lathous otan o xristis paralipsei eisodo se leitourgia i opoia tin apaitei.
     
  esac
 
done


if [ $OPTIND -eq 1 ]; then echo "6145"; fi  #otan to script mas exei mono mia eisodo ektipose to A.M 
if  [ $OPTIND -eq 3 ] && [ "$1" == "-f" ]; then grep -v '^#' $file_path; fi #ektiposi tou arxeiou opos exei xwris tis grammes me sxolia.
    

shift $(expr $OPTIND - 1) # afairese tis leitourgies apo tis parametrous thesis.



################################################################ END OF SCRIPT #############################################################################