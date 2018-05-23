//cube([40,40,2]);

Gab_Mag = 14; //Gab Magnet, Espacio para el iman
X_Poly = 92/2;
Y_Poly = 52/2;
H = 8 ; // Altura del objeto

D_Mag = 8.2 ; // Diametro del iman
H_Mag = 3.2 ; // Altura del iman 

E= 5; // Espesor
Vec_Poly_Ext = [[X_Poly+Gab_Mag,Y_Poly+E],[-(X_Poly+Gab_Mag),Y_Poly+E],[-(X_Poly+Gab_Mag),-(Y_Poly+E)],[X_Poly+Gab_Mag,-(Y_Poly+E)]];
Vec_Poly_Int = [[X_Poly,Y_Poly],[-X_Poly,Y_Poly],[-X_Poly,-Y_Poly],[X_Poly,-Y_Poly]];

//Vec_Poly_Ext = [[X_Poly+E,Y_Poly+E],[-(X_Poly+E),Y_Poly+E],[-(X_Poly+E),-(Y_Poly+E)],[X_Poly+E,-(Y_Poly+E)]];
//Vec_Poly_Int = [[X_Poly,Y_Poly],[-X_Poly,Y_Poly],[-X_Poly,-Y_Poly],[X_Poly,-Y_Poly]];



Twist_Obj = 3.15*8.5; 
Slices_Obj = 4;
Rot_Slice = Twist_Obj / Slices_Obj;
H_Slice = H/Slices_Obj;
echo ("Altura Capa es: ",H_Slice," mm");
echo ("Rotacion por Capa es: ",Rot_Slice,"°");

*polygon(points=Vec_Poly_Ext);
*color("red")
*polygon(points=Vec_Poly_Int);

difference()
{
    union()
    {
        linear_extrude(height = H, center = true, convexity = 0, twist = -Twist_Obj, slices = Slices_Obj)
        //translate([2, 0, 0])
        //circle(r=10);
        polygon(points=Vec_Poly_Ext);

       // color("red")
        linear_extrude(height = H, center = true, convexity = 0, twist = Twist_Obj, slices = Slices_Obj)
        //translate([2, 0, 0])
        //circle(r=10);
        polygon(points=Vec_Poly_Ext);
    }



    rotate([0,0,Rot_Slice])
    translate([0,0,H_Slice])
    union()
    {
        linear_extrude(height = H, center = true, convexity = 0, twist = -Twist_Obj, slices = Slices_Obj)
        //translate([2, 0, 0])
        //circle(r=10);
        polygon(points=Vec_Poly_Int);

      * color("red")
        linear_extrude(height = H, center = true, convexity = 0, twist = Twist_Obj, slices = Slices_Obj)
        //translate([2, 0, 0])
        //circle(r=10);
        polygon(points=Vec_Poly_Int);
    }
    //color("red")
    rotate([0,0,Twist_Obj])
        translate([X_Poly+Gab_Mag/2,0,H/2-H_Mag])
            cylinder(d=D_Mag, h=H_Mag, ceneter=true, $fn=32);
    //color("red")
    rotate([0,0,Twist_Obj])
        translate([-(X_Poly+Gab_Mag/2),0,H/2-H_Mag])
            cylinder(d=D_Mag, h=H_Mag, ceneter=true, $fn=32);
        //color("red")
    rotate([0,0,-Twist_Obj])
        translate([X_Poly+Gab_Mag/2,0,H/2-H_Mag])
            cylinder(d=D_Mag, h=H_Mag, ceneter=true, $fn=32);
    //color("red")
    rotate([0,0,-Twist_Obj])
        translate([-(X_Poly+Gab_Mag/2),0,H/2-H_Mag])
            cylinder(d=D_Mag, h=H_Mag, ceneter=true, $fn=32);
}



/*
 linear_extrude(height=10, scale=[1,0.1], slices=20, twist=0)
 polygon(points=[[0,0],[20,10],[20,-10]]);
 */

