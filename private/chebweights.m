function [weights, startid] = chebweights(maxlev)
% CHEBWEIGHTS   Get the 1D integration weights for the
% Chebyshev-Lobatto grid.

% Determine size of weights vector
n = 0;
for lev = 0:maxlev
	if lev == 0
		n = n + 1;
	elseif lev <= 2
		n = n + 2;
	else
		n = n + 2^(lev-1);
	end
end
weights = zeros(n, 1);
startid = zeros(maxlev+1,1);
wid = 0;

for lev = 0:maxlev
	w = getweights(lev);
	nw = length(w);
	weights(wid+1:wid+nw) = w;
	startid(lev+1) = wid + 1;
	wid = wid + nw;
	if lev > 0
		weights(wid+1:wid+nw) = w(end:-1:1);
		wid = wid + nw;
	end
end

% ------------------------------------------------------------
function w = getweights(level);

switch level
 case 0
	w = 1;
 case 1
	w = 1/6;
 case 2
	w = 4/15;
 case 3
	w = [0.7310932460800910e-1 0.1808589293602449e0];
 case 4
	w = [0.1868435141860280e-1 0.5445277629094545e-1 0.8158633214085165e-1 ...
			 0.9625693230646280e-1];
 case 5
	w = [0.4696598981477508e-2 0.1422895833861684e-1 0.2313138141887588e-1 ...
			 0.3113605477264700e-1 0.3794190022069424e-1 0.4328876922091372e-1 ...
			 0.4697162221938437e-1 0.4884909410402779e-1];
 case 6
	w = [0.1175745337655852e-2 0.3596346580868057e-2 0.5961697357106385e-2 ...
			 0.8267493828644795e-2 0.1049313721486872e-1 0.1261753249087738e-1 ...
			 0.1462032659873417e-1 0.1648227328498816e-1 0.1818546014331959e-1 ...
			 0.1971349435647805e-1 0.2105166555570905e-1 0.2218708961962866e-1 ...
			 0.2310883375546279e-1 0.2380802229262510e-1 0.2427792242857052e-1 ...
			 0.2451400921551278e-1];
 case 7
	w = [0.2940360769143488e-3 0.9015406334768120e-3 0.1501729349522486e-2 ...
			 0.2097768993592674e-2 0.2688623734200923e-2 0.3272954219311494e-2 ...
			 0.3849378894480414e-2 0.4416519337350668e-2 0.4973013924617290e-2 ...
			 0.5517524387136270e-2 0.6048740264035820e-2 0.6565382583469875e-2 ...
			 0.7066207189265470e-2 0.7550007862396335e-2 0.8015619293725290e-2 ...
			 0.8461919929232495e-2 0.8887834694376400e-2 0.9292337597834545e-2 ...
			 0.9674454211962260e-2 0.1003326402599179e-1 0.1036790266745074e-1 ...
			 0.1067756398712986e-1 0.1096150200299378e-1 0.1121903269861315e-1 ...
			 0.1144953567195303e-1 0.1165245563065572e-1 0.1182730373028884e-1 ...
			 0.1197365875238451e-1 0.1209116811946574e-1 0.1217954874463822e-1 ...
			 0.1223858771371722e-1 0.1226814279825748e-1];
 case 8
	w = [0.7351525341608230e-4 0.2255386861146224e-3 0.3761408925960376e-3 ...
			 0.5263839325262695e-3 0.6762772158963205e-3 0.8257514247828950e-3 ...
			 0.9747230359527335e-3 0.1123104860183050e-2 0.1270808676538312e-2 ...
			 0.1417746102064432e-2 0.1563828951467748e-2 0.1708969420574545e-2 ...
			 0.1853080200246322e-2 0.1996074559805394e-2 0.2137866415854293e-2 ...
			 0.2278370393511676e-2 0.2417501883385996e-2 0.2555177095945104e-2 ...
			 0.2691313114145510e-2 0.2825827944785238e-2 0.2958640568833836e-2 ...
			 0.3089670990877930e-2 0.3218840287755568e-2 0.3346070656414644e-2 ...
			 0.3471285461007978e-2 0.3594409279223868e-2 0.3715367947842303e-2 ...
			 0.3834088607501753e-2 0.3950499746658075e-2 0.4064531244715030e-2 ...
			 0.4176114414304666e-2 0.4285182042695174e-2 0.4391668432303478e-2 ...
			 0.4495509440289800e-2 0.4596642517211576e-2 0.4695006744714343e-2 ...
			 0.4790542872237596e-2 0.4883193352714024e-2 0.4972902377241032e-2 ...
			 0.5059615908703995e-2 0.5143281714331220e-2 0.5223849397161185e-2 ...
			 0.5301270426403320e-2 0.5375498166674075e-2 0.5446487906090825e-2 ...
			 0.5514196883206765e-2 0.5578584312770585e-2 0.5639611410295535e-2 ...
			 0.5697241415423040e-2 0.5751439614066900e-2 0.5802173359324730e-2 ...
			 0.5849412091144050e-2 0.5893127354731245e-2 0.5933292817692270e-2 ...
			 0.5969884285894845e-2 0.6002879718042550e-2 0.6032259238952060e-2 ...
			 0.6058005151525540e-2 0.6080101947411025e-2 0.6098536316344270e-2 ...
			 0.6113297154166585e-2 0.6124375569513695e-2 0.6131764889171710e-2 ...
			 0.6135460662096905e-2];
 case 9
	w = [0.1837920299513405e-4 0.5639426941218005e-4 0.9407953902099110e-4 ...
			 0.1317175062491197e-3 0.1693274738212602e-3 0.2069090180466811e-3 ...
			 0.2444581064683156e-3 0.2819697199383060e-3 0.3194384985132088e-3 ...
			 0.3568589462646712e-3 0.3942255086493225e-3 0.4315326058930806e-3 ...
			 0.4687746490660092e-3 0.5059460486190280e-3 0.5430412193610545e-3 ...
			 0.5800545836399640e-3 0.6169805735653530e-3 0.6538136326952525e-3 ...
			 0.6905482174102765e-3 0.7271787980986570e-3 0.7636998602229580e-3 ...
			 0.8001059053103655e-3 0.8363914518921075e-3 0.8725510364079350e-3 ...
			 0.9085792140858705e-3 0.9444705598038330e-3 0.9802196689375405e-3 ...
			 0.1015821158197620e-2 0.1051269666457923e-2 0.1086559855576405e-2 ...
			 0.1121686411209499e-2 0.1156644043620625e-2 0.1191427488483255e-2 ...
			 0.1226031507678833e-2 0.1260450890089720e-2 0.1294680452387282e-2 ...
			 0.1328715039815158e-2 0.1362549526967749e-2 0.1396178818563874e-2 ...
			 0.1429597850215596e-2 0.1462801589192124e-2 0.1495785035178756e-2 ...
			 0.1528543221030770e-2 0.1561071213522176e-2 0.1593364114089260e-2 ...
			 0.1625417059568808e-2 0.1657225222930917e-2 0.1688783814006311e-2 ...
			 0.1720088080208046e-2 0.1751133307247511e-2 0.1781914819844620e-2 ...
			 0.1812427982432104e-2 0.1842668199853792e-2 0.1872630918056778e-2 ...
			 0.1902311624777385e-2 0.1931705850220816e-2 0.1960809167734396e-2 ...
			 0.1989617194474294e-2 0.2018125592065660e-2 0.2046330067256026e-2 ...
			 0.2074226372561928e-2 0.2101810306908615e-2 0.2129077716262765e-2 ...
			 0.2156024494258114e-2 0.2182646582813902e-2 0.2208939972746034e-2 ...
			 0.2234900704370890e-2 0.2260524868101660e-2 0.2285808605037146e-2 ...
			 0.2310748107542917e-2 0.2335339619824746e-2 0.2359579438494242e-2 ...
			 0.2383463913126580e-2 0.2406989446810260e-2 0.2430152496688800e-2 ...
			 0.2452949574494292e-2 0.2475377247072736e-2 0.2497432136901066e-2 ...
			 0.2519110922595807e-2 0.2540410339413268e-2 0.2561327179741214e-2 ...
			 0.2581858293581922e-2 0.2602000589026571e-2 0.2621751032720874e-2 ...
			 0.2641106650321898e-2 0.2660064526945994e-2 0.2678621807607777e-2 ...
			 0.2696775697650070e-2 0.2714523463164784e-2 0.2731862431404634e-2 ...
			 0.2748789991185645e-2 0.2765303593280398e-2 0.2781400750801929e-2 ...
			 0.2797079039578254e-2 0.2812336098517438e-2 0.2827169629963175e-2 ...
			 0.2841577400040801e-2 0.2855557238993716e-2 0.2869107041510142e-2 ...
			 0.2882224767040173e-2 0.2894908440103080e-2 0.2907156150584813e-2 ...
			 0.2918966054025654e-2 0.2930336371897992e-2 0.2941265391874162e-2 ...
			 0.2951751468084314e-2 0.2961793021364282e-2 0.2971388539493396e-2 ...
			 0.2980536577422218e-2 0.2989235757490164e-2 0.2997484769632976e-2 ...
			 0.3005282371580012e-2 0.3012627389041325e-2 0.3019518715884516e-2 ...
			 0.3025955314301304e-2 0.3031936214963825e-2 0.3037460517170602e-2 ...
			 0.3042527388982196e-2 0.3047136067346484e-2 0.3051285858213582e-2 ...
			 0.3054976136640360e-2 0.3058206346884558e-2 0.3060976002488480e-2 ...
			 0.3063284686352252e-2 0.3065132050796635e-2 0.3066517817615388e-2 ...
			 0.3067441778117160e-2 0.3067903793156924e-2];
 case 10
	w = [0.4594825101421781e-5 0.1409916725826165e-4 0.2352265498446908e-4 ...
			 0.3293697438176069e-4 0.4234801329541514e-4 0.5175672728724115e-4 ...
			 0.6116316883172130e-4 0.7056714263210160e-4 0.7996836689383115e-4 ...
			 0.8936652432761725e-4 0.9876128129268575e-4 0.1081522959439709e-3 ...
			 0.1175392220522666e-3 0.1269217109401817e-3 0.1362994125285721e-3 ...
			 0.1456719759343222e-3 0.1550390498290048e-3 0.1644002826639858e-3 ...
			 0.1737553228178748e-3 0.1831038186972169e-3 0.1924454188081532e-3 ...
			 0.2017797718095568e-3 0.2111065265540606e-3 0.2204253321209953e-3 ...
			 0.2297358378438129e-3 0.2390376933336856e-3 0.2483305485004054e-3 ...
			 0.2576140535713497e-3 0.2668878591090418e-3 0.2761516160276766e-3 ...
			 0.2854049756088732e-3 0.2946475895168438e-3 0.3038791098131167e-3 ...
			 0.3130991889709135e-3 0.3223074798892559e-3 0.3315036359068575e-3 ...
			 0.3406873108158442e-3 0.3498581588753336e-3 0.3590158348249004e-3 ...
			 0.3681599938979439e-3 0.3772902918349750e-3 0.3864063848968331e-3 ...
			 0.3955079298778412e-3 0.4045945841189076e-3 0.4136660055205786e-3 ...
			 0.4227218525560474e-3 0.4317617842841222e-3 0.4407854603621558e-3 ...
			 0.4497925410589400e-3 0.4587826872675654e-3 0.4677555605182480e-3 ...
			 0.4767108229911242e-3 0.4856481375290144e-3 0.4945671676501560e-3 ...
			 0.5034675775609050e-3 0.5123490321684090e-3 0.5212111970932495e-3 ...
			 0.5300537386820535e-3 0.5388763240200765e-3 0.5476786209437525e-3 ...
			 0.5564602980532185e-3 0.5652210247248035e-3 0.5739604711234900e-3 ...
			 0.5826783082153415e-3 0.5913742077799035e-3 0.6000478424225650e-3 ...
			 0.6086988855868985e-3 0.6173270115669570e-3 0.6259318955195450e-3 ...
			 0.6345132134764545e-3 0.6430706423566675e-3 0.6516038599785245e-3 ...
			 0.6601125450718580e-3 0.6685963772900920e-3 0.6770550372223075e-3 ...
			 0.6854882064052710e-3 0.6938955673354260e-3 0.7022768034808515e-3 ...
			 0.7106315992931800e-3 0.7189596402194805e-3 0.7272606127141040e-3 ...
			 0.7355342042504880e-3 0.7437801033329270e-3 0.7519979995083010e-3 ...
			 0.7601875833777640e-3 0.7683485466083955e-3 0.7764805819448105e-3 ...
			 0.7845833832207255e-3 0.7926566453704920e-3 0.8007000644405765e-3 ...
			 0.8087133376010115e-3 0.8166961631567915e-3 0.8246482405592380e-3 ...
			 0.8325692704173110e-3 0.8404589545088850e-3 0.8483169957919750e-3 ...
			 0.8561430984159225e-3 0.8639369677325335e-3 0.8716983103071715e-3 ...
			 0.8794268339298080e-3 0.8871222476260225e-3 0.8947842616679575e-3 ...
			 0.9024125875852290e-3 0.9100069381757865e-3 0.9175670275167260e-3 ...
			 0.9250925709750540e-3 0.9325832852184080e-3 0.9400388882257195e-3 ...
			 0.9474590992978345e-3 0.9548436390680820e-3 0.9621922295127915e-3 ...
			 0.9695045939617610e-3 0.9767804571086730e-3 0.9840195450214600e-3 ...
			 0.9912215851526205e-3 0.9983863063494750e-3 0.1005513438864381e-2 ...
			 0.1012602714364884e-2 0.1019653865943825e-2 0.1026666628129384e-2 ...
			 0.1033640736895078e-2 0.1040575929669704e-2 0.1047471945347220e-2 ...
			 0.1054328524296576e-2 0.1061145408371496e-2 0.1067922340920188e-2 ...
			 0.1074659066795011e-2 0.1081355332362081e-2 0.1088010885510822e-2 ...
			 0.1094625475663454e-2 0.1101198853784431e-2 0.1107730772389814e-2 ...
			 0.1114220985556592e-2 0.1120669248931938e-2 0.1127075319742408e-2 ...
			 0.1133438956803086e-2 0.1139759920526660e-2 0.1146037972932446e-2 ...
			 0.1152272877655342e-2 0.1158464399954736e-2 0.1164612306723335e-2 ...
			 0.1170716366495947e-2 0.1176776349458194e-2 0.1182792027455163e-2 ...
			 0.1188763173999998e-2 0.1194689564282426e-2 0.1200570975177222e-2 ...
			 0.1206407185252609e-2 0.1212197974778593e-2 0.1217943125735239e-2 ...
			 0.1223642421820877e-2 0.1229295648460247e-2 0.1234902592812577e-2 ...
			 0.1240463043779596e-2 0.1245976792013482e-2 0.1251443629924746e-2 ...
			 0.1256863351690042e-2 0.1262235753259924e-2 0.1267560632366521e-2 ...
			 0.1272837788531157e-2 0.1278067023071898e-2 0.1283248139111029e-2 ...
			 0.1288380941582472e-2 0.1293465237239126e-2 0.1298500834660144e-2 ...
			 0.1303487544258138e-2 0.1308425178286322e-2 0.1313313550845575e-2 ...
			 0.1318152477891441e-2 0.1322941777241062e-2 0.1327681268580034e-2 ...
			 0.1332370773469193e-2 0.1337010115351341e-2 0.1341599119557886e-2 ...
			 0.1346137613315420e-2 0.1350625425752227e-2 0.1355062387904712e-2 ...
			 0.1359448332723766e-2 0.1363783095081051e-2 0.1368066511775222e-2 ...
			 0.1372298421538068e-2 0.1376478665040584e-2 0.1380607084898972e-2 ...
			 0.1384683525680562e-2 0.1388707833909670e-2 0.1392679858073372e-2 ...
			 0.1396599448627208e-2 0.1400466458000814e-2 0.1404280740603477e-2 ...
			 0.1408042152829620e-2 0.1411750553064202e-2 0.1415405801688056e-2 ...
			 0.1419007761083142e-2 0.1422556295637728e-2 0.1426051271751498e-2 ...
			 0.1429492557840582e-2 0.1432880024342508e-2 0.1436213543721080e-2 ...
			 0.1439492990471182e-2 0.1442718241123500e-2 0.1445889174249176e-2 ...
			 0.1449005670464370e-2 0.1452067612434768e-2 0.1455074884879987e-2 ...
			 0.1458027374577922e-2 0.1460924970369010e-2 0.1463767563160407e-2 ...
			 0.1466555045930107e-2 0.1469287313730960e-2 0.1471964263694632e-2 ...
			 0.1474585795035472e-2 0.1477151809054310e-2 0.1479662209142169e-2 ...
			 0.1482116900783908e-2 0.1484515791561778e-2 0.1486858791158898e-2 ...
			 0.1489145811362661e-2 0.1491376766068049e-2 0.1493551571280882e-2 ...
			 0.1495670145120974e-2 0.1497732407825220e-2 0.1499738281750598e-2 ...
			 0.1501687691377087e-2 0.1503580563310520e-2 0.1505416826285341e-2 ...
			 0.1507196411167288e-2 0.1508919250955996e-2 0.1510585280787524e-2 ...
			 0.1512194437936792e-2 0.1513746661819944e-2 0.1515241893996628e-2 ...
			 0.1516680078172202e-2 0.1518061160199842e-2 0.1519385088082595e-2 ...
			 0.1520651811975324e-2 0.1521861284186590e-2 0.1523013459180452e-2 ...
			 0.1524108293578172e-2 0.1525145746159854e-2 0.1526125777865997e-2 ...
			 0.1527048351798960e-2 0.1527913433224360e-2 0.1528720989572367e-2 ...
			 0.1529470990438944e-2 0.1530163407586983e-2 0.1530798214947369e-2 ...
			 0.1531375388619965e-2 0.1531894906874509e-2 0.1532356750151432e-2 ...
			 0.1532760901062598e-2 0.1533107344391951e-2 0.1533396067096098e-2 ...
			 0.1533627058304791e-2 0.1533800309321344e-2 0.1533915813622952e-2 ...
			 0.1533973566860944e-2];
 otherwise
	warning('MATLAB:spinterp:unsupportedWeights',['Maximum depth (level 10) ' ... 
	  'exceeded for precomputed weights of Chebyshev grid. Using all-zero ' ...
		'weights for levels > 10.']);
	w = zeros(2^(level-2),1);
end
