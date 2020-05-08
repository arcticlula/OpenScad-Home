units = 10; 
scale = 30; 
$fn = 60; 	// facets
s = units/scale;	// scaling factor 
soft = 2*s;	// radius for soft bevels depends on scale
sharp = 1*.2; 	// radius for sharper edges

/* [Furniture Type] */

//Escolher o Sofa.
escolha = 8; //	[1:Sofá Pequeno,2:Sofá Grande,3:Estante Sala,4:Móvel TV, 5:Móvel CDs, 6:Puff Sala, 7: Coluna Sala, 8: Mesa Sala]

main(); // build it!

module main(){

	// custom designs with user dimensions
	if (escolha==1) sofa(depth=79,length=74,height=79,numCushions=1,depthBack=7,heightBack=72,depthBackCushion=18,heightBottom=26.5,heightBottomCushion=10,lengthArm=13.5,heightArm=53.5,depthFeet=8,lengthFeet=8,heightFeet=3.5);
	if (escolha==2) sofa(depth=79,length=180,height=79,numCushions=3,depthBack=7,heightBack=72,depthBackCushion=18,heightBottom=24.5,heightBottomCushion=10.5,lengthArm=13.5,heightArm=53.5,depthFeet=8,lengthFeet=8,heightFeet=3.5);
	if (escolha==3) estanteSala();
	if (escolha==4) movelTV();
	if (escolha==5) movelCD();
	if (escolha==6) puff();
	if (escolha==7) colunaSala();
	if (escolha==8) mesaSala();
}

module estanteSala() {
	scale(s)
	union(){
		cuboid(35,210,10,soft);
		for (a =[0:2]) {
			translate([0,0,10 + 5*a + 35*(a+1)]) cuboid(35,210,5,soft);
		}
		translate([0,20,0]) cuboid(35,5,130,soft);
		translate([0,210-20,0]) cuboid(35,5,130,soft);
	}
}

module puff() {
	scale(s)
	union(){
		depth = 71;
		length = 71;
		height = 27;
		heightCushion = 10;
		espFeet = 2.5;
		heightFeet = 4;
		depthFeet = 8;
		lengthFeet = 8;
		translate([espFeet,espFeet,-heightFeet + 1]) cuboid(depthFeet,lengthFeet,heightFeet + 1,soft);
        translate([depth - depthFeet - espFeet,espFeet,-heightFeet]) cuboid(depthFeet,lengthFeet,heightFeet + 1,soft);
        translate([espFeet,length - depthFeet - espFeet,-heightFeet]) cuboid(depthFeet,lengthFeet,heightFeet + 1,soft);
        translate([depth - depthFeet - espFeet,length - lengthFeet - espFeet,-heightFeet]) cuboid(depthFeet,lengthFeet,heightFeet + 1,soft);
		cuboid(depth,length,height,soft*5);
		translate([0,0,height]) cuboid(depth,length,heightCushion,soft*9);
	}
}

module colunaSala() {
	scale(s)
	union(){
		depth = 26;
		length = 24.5;
		height = 37.5;
		depth2 = 1;
		length2 = 21;
		length3 = 16;
		height2 = 36;
		difference() {
			translate([-0.5,length/2,height-10]) rotate([0,90,0]) cylinder(depth/2,3.5,3.5);
			translate([-1.1,length/2,height-10]) rotate([0,90,0]) cylinder(depth/2,3,3);
		}
		difference() {
			translate([-1,length/2-9.5/2,5.5]) cuboid(5,9.5,8,soft);
			translate([-1.1,length/2-6.5/2,7]) cuboid(5,6.5,5,soft);
		}
		difference() {
			cuboid(depth,length,height,soft*2); //body
			translate([0,length/2,height-10]) rotate([0,90,0]) cylinder(depth/2,3,3);
			translate([-1.1,length/2-6.5/2,7]) cuboid(5,6.5,5,soft);
		}
		hull() {
			translate([depth,(length-length2)/2,(height-height2)/2]) cuboid(depth2/2,length2,height2,soft);
			translate([depth+depth2/2,(length-length3)/2,(height-height2)/2]) cuboid(depth2/2,length3,height2,soft);
		} //front
	}
}

module TV() {
	scale(s)
	union(){
		
	}
}

module mesaSala() {
	scale(s)
	union(){
		color("blue") translate([110/2,55,0]) oval(55,55,3);
		color("blue") translate([0,55,0]) cube([110,40,3]);
		color("blue") translate([110/2,55+40,0]) oval(55,55,3);

		color("blue") translate([0,55,1.5]) rotate([270,0,0]) cylinder(40,1.5,1.5);
		color("blue") translate([110,55,1.5]) rotate([270,0,0]) cylinder(40,1.5,1.5);
		color("blue") translate([110/2,55,1.5])#rotate_extrude()translate([55,0,0])circle(r=1.5); 
		color("blue") translate([110/2,55+40,1.5])#rotate_extrude()translate([55,0,0])circle(r=1.5); 


		difference() {
			translate([110/2,75,-6]) cylinder(8,50.5,50.5);
			translate([110/2,75,-7]) cylinder(8,49,49);
		}
		// translate([110/2,75,-6]) cylinder(9,5.5,5.5); //temp
		translate([110/2,75,-6-66]) {
			// rotate([0, 0, 45]) translate([-2.75,-2.75,0]) cuboid(5.5,5.5,66+7,soft*2);
			rotate([0, 0, 45]) translate([-2.75 + 101/2 -1,-2.75,0]) cuboid(5.5,5.5,66+7,soft);
			rotate([0, 0, 45]) translate([-2.75,-2.75 +101/2-1,0])  cuboid(5.5,5.5,66+7,soft);
			rotate([0, 0, 45]) translate([-2.75 ,-2.75 - 101/2 +1,0])  cuboid(5.5,5.5,66+7,soft);
			rotate([0 ,0, 45]) translate([-2.75 -101/2+1,-2.75,0]) cuboid(5.5,5.5,66+7,soft);
		}
		translate([110/2,75,-6-66+13.5]) {
			rotate([0, 0, 45]) translate([-51,-4/2,0]) cuboid(102,4,5.2,sharp);
			rotate([0, 0, 135]) translate([-51,-4/2,0]) cuboid(102,4,5.2,sharp);
		}
	}
}

module oval(w,h, height, center = false) {
 scale([1, h/w, 1]) cylinder(h=height, r=w, center=center);
}

module movelTV() {
	scale(s)
	union(){
		// difference () {
		cil = 4;
		offset = 2.5;
		cuboid(60,181,3.5,soft); //base
		translate([offset,offset,0]) peMovelTV();
		translate([60 - cil - offset,offset,0]) peMovelTV();
		translate([offset,181 - cil - offset,0]) peMovelTV();
		translate([60 - cil - offset,181 - cil - offset,0]) peMovelTV();
		translate([offset,90.5-cil,0]) peMovelTV();
		translate([60 - cil - offset,90.5 - cil,0]) peMovelTV();
		// // }
		
		translate([0,0,31-3.5]) cuboid(60,135,3.5,soft); //topo
		cuboid(60,2.5,31,soft); //esquerda
		translate([0,135-2.5,0]) cuboid(60,2.5,31,soft); //direita
		translate([0,94-2.5,0]) cuboid(60,2.5,31,soft); //meio vert
		translate([10,94,3.5]){
			esp =3;
			translate([-10,0,0]){
				translate([0,-3.5+esp,-1]) cube([55,135-94,3]);
				translate([0,-3.5+esp,31-3.5-3.5-2]) railMovelTV();
				translate([0,135-94-2.5-esp-1.5,31-3.5-3.5-2]) railMovelTV();
			}
			// translate([0,esp-1,esp]) cuboid(50,2,31-7-esp-esp-1,sharp); 
			// translate([0,135-94-2.5-esp-1,esp]) cuboid(50,2,31-7-esp-esp-1,sharp); 
			// translate([0,esp,esp]) cuboid(50,135-94-2.5-esp-esp,1.5,sharp); 
			//// translate([0,esp,31-3.5-3.5-esp-1.5]) cuboid(50,135-94-2.5-esp-esp,1.5,sharp); 
			// translate([0,esp,esp]) cuboid(3,135-94-2.5-esp-esp,31-7-esp-esp-1,sharp); 
			// translate([50-1,0,0]) cuboid(2.5,135-94-2.5,31-7,sharp); 
			// hull() {
			// 	translate([50-1,0,0]) cuboid(1.5,135-94-2.5,31-7,sharp); 
			// 	translate([50,4,4]) rotate([0,90,0]) cylinder(1.5,2,1.5);
			// 	translate([50,135-94-2.5-4,4]) rotate([0,90,0]) cylinder(1.5,2,1.5);
			// 	translate([50,4,31-3.5-3.5-4]) rotate([0,90,0]) cylinder(1.5,2,1.5);
			// 	translate([50,135-94-2.5-4,31-3.5-3.5-4]) rotate([0,90,0]) cylinder(1.5,2,1.5);
			// }
		} 
		translate([0,0,17-2]) cuboid(60,94,2,soft); //meio horiz
		translate([0,0,0]) cuboid(2,135,31,soft); //tras
	}
}

module peMovelTV() {
	radius = 2;
	height = 7.5;
	translate([radius,radius,- height]) cylinder(height+2,radius,radius); //tras gaveta
}

module railMovelTV() {
	cube([55,5,3]);
}

module movelCD() {
	scale(s)
	union(){
		cuboid(34.5,34,1,soft); //base
		translate([0,0,34-1]) cuboid(34.5,34,1,soft); //topo
		cuboid(34.5,1,34,soft); //esq
		translate([0,34-1,0]) cuboid(34.5,1,34,soft); //direita
		cuboid(1,34,34,soft); //tras 
		alturaGaveta = 7;
		paredeCaixa = 1;
		espLado = (34 - paredeCaixa*2 - 29)/2;
		espBaixo = 1;
		espFundo = 1;
		translate([paredeCaixa,0,paredeCaixa-1]) {
			railMovelCD();
			translate([0,34 - paredeCaixa - 2,0]) railMovelCD();
			translate([0,0,alturaGaveta + 7.5]) railMovelCD();
			translate([0,34 - paredeCaixa - 2,alturaGaveta + 7.5]) railMovelCD();
		}
		translate([paredeCaixa + espFundo,paredeCaixa + espLado,paredeCaixa + espBaixo]) {
			gavetaMovelCD();
			translate([0,0,alturaGaveta + 7.5]) gavetaMovelCD();
		}
	}
}

module railMovelCD() {
	cube([25,3,2]);
}

module gavetaMovelCD() {
	espParede = 1;
	translate([0,0,0]) cuboid(1.5,29,7,sharp); //tras gaveta
	translate([0,0,0]) cuboid(30,1.5,7,sharp); //esq gaveta
	translate([0,29 - espParede-0.5,0]) cuboid(30,1.5,7,sharp); //dir gaveta
	translate([30 - espParede-0.5,0,0]) cuboid(1.5,29,7,sharp); //frente gaveta
	translate([0,0,0]) cuboid(30,29,2,sharp); //chão gaveta
}

module sofa(depth,length,height,numCushions,depthBack,heightBack,depthBackCushion,heightBottom,heightBottomCushion,lengthArm,heightArm,depthFeet,lengthFeet,heightFeet){
	scale(s)
	union(){
		armRadius = 9;
        //feet
        translate([6,5,-heightFeet + 0.1]) cuboid(depthFeet,lengthFeet,heightFeet + 1,soft);
        translate([depth - depthFeet - 6,5,-heightFeet]) cuboid(depthFeet,lengthFeet,heightFeet + 1,soft);
        translate([6,length - depthFeet - 5,-heightFeet]) cuboid(depthFeet,lengthFeet,heightFeet + 1,soft);
        translate([depth - depthFeet - 6,length - lengthFeet - 5,-heightFeet]) cuboid(depthFeet,lengthFeet,heightFeet + 1,soft);
		// back of sofa
		translate([0,0,0]) cuboid(depthBack,length,heightBack,soft*5);
		// left arm of sofa
		cuboid(depth,lengthArm,heightArm - armRadius/1.5,soft*5);
		translate([0,armRadius/2 - 0.5,heightArm - armRadius]) rotate([0,90,0]) cylinder(depth, armRadius, armRadius);
		// right arm of sofa
		translate([0,length - lengthArm,0]) cuboid(depth,lengthArm,heightArm - armRadius/1.5,soft*5);
		translate([0,length - armRadius/2 + 0.5,heightArm - armRadius]) rotate([0,90,0]) cylinder(depth, armRadius, armRadius);
        // botttom of sofa
        cuboid(depth,length,heightBottom,soft*10);
		// cushions bottom
        for (a =[0:numCushions-1]) {
        	translate([depthBack + 1,lengthArm + ((length - lengthArm*2 - 0.5*(numCushions - 1))/numCushions)*a + 0.5*a,heightBottom + 1]) cuboid(depth-depthBack,((length - lengthArm *2 - 0.5*(numCushions - 1))/numCushions),heightBottomCushion,soft*10);
         }
		 echo((length - (lengthArm + 1)*2 - 0.5*(numCushions - 1))/numCushions);
        // cushions back
		for (a =[0:numCushions-1]) {
			if (numCushions==1) {
				translate([depthBack + 1,0,heightBottom+heightBottomCushion]) cuboid(depthBackCushion,((length - (lengthArm + 1)*2 - 0.5*(numCushions - 1))/numCushions) + (lengthArm + 1)*2,height - (heightBottom + heightBottomCushion),soft*10);
			}
			else if(a==0) {
				translate([depthBack + 1,0,heightBottom+heightBottomCushion]) cuboid(depthBackCushion,((length - (lengthArm + 1)*2 - 0.5*(numCushions - 1))/numCushions) + (lengthArm + 1),height - (heightBottom + heightBottomCushion),soft*10);
			}
			else if(a==(numCushions-1)){
				translate([depthBack + 1,(lengthArm+1) + ((length - (lengthArm + 1)*2 - 0.5*(numCushions - 1))/numCushions)*a + 0.5*a,heightBottom+heightBottomCushion]) cuboid(depthBackCushion,((length - (lengthArm + 1)*2 - 0.5*(numCushions - 1))/numCushions) + (lengthArm + 1),height - (heightBottom + heightBottomCushion),soft*10);
			}
			else {
				translate([depthBack + 1,(lengthArm+1) + ((length - (lengthArm + 1)*2 - 0.5*(numCushions - 1))/numCushions)*a + 0.5*a,heightBottom+heightBottomCushion]) cuboid(depthBackCushion,((length - (lengthArm + 1)*2 - 0.5*(numCushions - 1))/numCushions),height - (heightBottom + heightBottomCushion),soft*10);
			}
		}
	}
		// translate([depthBack + 1,0,35]) cuboid(18,64.5,44,soft*10);
        // translate([depthBack + 1,lengthArm + lenghtCushion + 0.5,heightBottom + heightBottomCushion]) cuboid(depthBackCushion,lenghtCushion,height - (heightBottom + heightBottomCushion),soft*10);
        // translate([depthBack + 1,lengthArm + lenghtCushion*2 + 0.5*2,heightBottom + heightBottomCushion]) cuboid(depthBackCushion,lenghtCushion + lengthArm + 1,height - (heightBottom + heightBottomCushion),soft*10);
}

module cuboid(depth,length,height,r) {
	hull(){
		translate([r,r,r]) sphere(r);
		translate([depth-r,r,r]) sphere(r);
		translate([depth-r,length-r,r]) sphere(r);
		translate([r,length-r,r]) sphere(r);
		translate([r,length-r,height-r]) sphere(r);
		translate([depth-r,length-r,height-r]) sphere(r);
		translate([depth-r,r,height-r]) sphere(r);
		translate([r,r,height-r]) sphere(r);
	}
}