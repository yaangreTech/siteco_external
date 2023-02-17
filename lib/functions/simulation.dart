
//components
double LENGTH_SPECIFICATION = 25;
double ACTUAL_SPECIFICATION = 0;
double BLIND_SPACING = 0;
double UNITS_OF_LENGTH = 0;
double MOUNTING_RAIL1 = 0;
double MOUNTING_RAIL2 = 0;
double MOUNTING_RAIL3 = 0;
double JOINT_COVER = 0;
double FEED_IN = 0;
double BLANKCOVER = 5;
double CHAIN_SUSPENSION = 0;
double BLANKING_DISTANCE = 0;
double LUMINAIRE = 0;

//Factors
const F_MOUNTING_RAIL1 = 1.5;
const F_MOUNTING_RAIL2 = 3.0;
const F_MOUNTING_RAIL3 = 4.5;
const F_BLANKCOVER = 1.5;
const F_LUMINAIRE = 1.5;
const F_FEEDIN = 0;

void main() {
  LUMINAIRE = CALC_LUMINAIRE(length_spec: LENGTH_SPECIFICATION);
  BLANKCOVER = 5;//CALC_BLANKCOVER(length_spec: LENGTH_SPECIFICATION, luminair: LUMINAIRE);
  UNITS_OF_LENGTH = CALC_UNITS_OF_LENGTH(blankcover: BLANKCOVER, luminair: LUMINAIRE);
  FEED_IN = CALC_FEED_IN(unit_of_length: UNITS_OF_LENGTH);
  ACTUAL_SPECIFICATION = CALC_ACTUAL_SPECIFICATION(feedin: FEED_IN, blankcover: BLANKCOVER, luminair: LUMINAIRE);
  BLIND_SPACING = CALC_BLIND_SPACING(blankcover: BLANKCOVER, luminair: LUMINAIRE);
  MOUNTING_RAIL3 = CALC_MOUNTING_RAIL_3(chosenMoutingRail3 : "Tragschiene 3-langig", unit_of_length : UNITS_OF_LENGTH);
  MOUNTING_RAIL2 = CALC_MOUNTING_RAIL_2(unit_of_length: UNITS_OF_LENGTH, mounting_rail_3: MOUNTING_RAIL3);
  MOUNTING_RAIL1 = CALC_MOUNTING_RAIL_1(unit_of_length: UNITS_OF_LENGTH,mounting_rail_2: MOUNTING_RAIL2, mounting_rail_3: MOUNTING_RAIL3);
  JOINT_COVER = CALC_JOINT_COVER(luminair: LUMINAIRE, mounting_rail_1: MOUNTING_RAIL1, mounting_rail_2: MOUNTING_RAIL2, mounting_rail_3: MOUNTING_RAIL3);
  CHAIN_SUSPENSION = CALC_CHAIN_SUSPENSION(unit_of_length: UNITS_OF_LENGTH, blanking_distance: BLANKING_DISTANCE);
  print("LENGTH_SPECIFICATION: ${LENGTH_SPECIFICATION}");
  print("ACTUAL_SPECIFICATION: ${ACTUAL_SPECIFICATION}");
  print("BLIND_SPACING: ${BLIND_SPACING}");
  print("UNITS_OF_LENGTH: ${UNITS_OF_LENGTH}");
  print("MOUNTING_RAIL1: ${MOUNTING_RAIL1}");
  print("MOUNTING_RAIL2: ${MOUNTING_RAIL2}");
  print("MOUNTING_RAIL3: ${MOUNTING_RAIL3}");
  print("JOINT_COVER: ${JOINT_COVER}");
  print("FEED_IN: ${FEED_IN}");
  print("BLANKCOVER: ${BLANKCOVER}");
  print("CHAIN_SUSPENSION: ${CHAIN_SUSPENSION}");
  print("BLANKING_DISTANCE: ${BLANKING_DISTANCE}");
  print("LUMINAIRE: ${LUMINAIRE}");
}

// calculates the luminair
double CALC_LUMINAIRE ({double length_spec = 0})
{
  double size = 0;
  if(length_spec>0)
  {
    size = (( length_spec / 1.5 ).floorToDouble() * 1.5 ) / F_LUMINAIRE;
    size = RoundUp(size, 0);
  }
  return size;
}

//calculates the size of the blankcover
double CALC_BLANKCOVER ({double length_spec = 0, double luminair = 0})
{
  double size = 0;
  if(luminair>0)
  {
    if(length_spec > 0)
    {
      size = (length_spec/1.5).floorToDouble() * 1.5;
      size = size - (luminair*F_LUMINAIRE) / F_BLANKCOVER;
    }
    else
    {
      size = CeilingXCL(luminair*F_LUMINAIRE, 1.5) - (luminair*F_LUMINAIRE) /F_BLANKCOVER ;
    }
  }
  return size;
}
// calculates the unit of length
double CALC_UNITS_OF_LENGTH ({double blankcover = 0, double luminair = 0})
{
  double size = 0;
  size = ( blankcover * F_BLANKCOVER + luminair * F_LUMINAIRE ) / 1.5;
  size = RoundUp(size, 0);
  return size;
}

//calculates the feedin size
double CALC_FEED_IN ({double unit_of_length = 0})
{
  double size = 0;
  if(unit_of_length > 0)
  {
    size = 1;
  }
  return size;
}

//actual specification
double CALC_ACTUAL_SPECIFICATION ({double feedin = 0, double blankcover = 0, double luminair = 0})
{
  double size = 0;
  size = (feedin * F_FEEDIN) + RoundUp((blankcover*F_BLANKCOVER + luminair * F_LUMINAIRE) / 1.5, 0);
  size = size * 1.5;
  return size;
}

//calculates template size
double CALC_BLIND_SPACING ({double blankcover = 0, double luminair = 0})
{
  double size = 0;
  if(luminair > 1)
  {
    size = blankcover * F_BLANKCOVER / (luminair - 1);
    size = RoundUp(size, 3);
  }
  return size;
}

//calculates template size
double CALC_MOUNTING_RAIL_3 ({String chosenMoutingRail3 = "Tragschiene 3-langig", double unit_of_length = 0})
{
  double size = 0;
  if(chosenMoutingRail3 == "Tragschiene 3-langig" && unit_of_length > 1)
  {
    var x = (unit_of_length/3).floorToDouble();
    var y = (unit_of_length/3).floorToDouble() - 1;

    var w = ( unit_of_length - (unit_of_length/3).floorToDouble() * 3 ) / 2;
    w = w.floorToDouble() * 2 ;

    var v = (unit_of_length/3).floorToDouble() * 3;
    if((unit_of_length - v - w).floorToDouble() == 1)
    {
      size = y;
    }
    else
    {
      size = x;
    }

  }
  return size;
}

//calculates mouting rail 2 size
double CALC_MOUNTING_RAIL_2 ({double unit_of_length = 0, double mounting_rail_3 = 0})
{
  double size = 0;
  size = (( unit_of_length - mounting_rail_3 * 3) / 2 ).floorToDouble();
  return size;
}

//calculates mouting rail 1 size
double CALC_MOUNTING_RAIL_1 ({double unit_of_length = 0, double mounting_rail_2 = 0, double mounting_rail_3 = 0})
{
  double size = 0;
  size = (( unit_of_length - mounting_rail_3 * 3 - mounting_rail_2 * 2) / 1 ).floorToDouble();
  return size;
}

//calculates joint-cover's size
double CALC_JOINT_COVER ({double luminair = 0, String accessories = "Zuberhor IP64", double mounting_rail_1 = 0, double mounting_rail_2 = 0 , double mounting_rail_3 = 0})
{
  double size = 0;
  if(accessories=="Zuberhor IP64" && luminair>0)
  {
    size = mounting_rail_1 + mounting_rail_2 + mounting_rail_3 - 1;
  }
  return size;
}

//calculates chain's suspension size
double CALC_CHAIN_SUSPENSION ({double unit_of_length = 0, double blanking_distance = 0})
{
  double size = 0;
  if(unit_of_length > 0)
  {
    size = RoundUp(unit_of_length / 2, 0) + 1 - blanking_distance;
  }
  return size;
}

//calculates template size
double template ()
{
  double size = 0;
  return size;
}


//function to round up a number
double RoundUp (num number, int deg)=> double.parse(number.toStringAsFixed(deg));

//function Ceiling.xcl
double CeilingXCL(num number, double deg)
{
  double newVal = 0;
  if((number/deg)>0)
  {
    newVal = RoundUp((number/deg), 0)*deg;
  }
  else
  {
    newVal = (number~/deg).floorToDouble()*deg;
  }
  return newVal;
}
