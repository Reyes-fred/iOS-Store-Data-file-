//
//  ViewController.m
//  RegistroBD
//
//  Created by Alfredo Reyes on 11/3/16.
//  Copyright © 2016 Alfredo Reyes. All rights reserved.
//

#import "ViewController.h"



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)mostrar:(id)sender {
   
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"usuario.txt"];
    
    NSString *entireFileInString = [NSString stringWithContentsOfFile:filePath];
    NSArray *lines = [entireFileInString componentsSeparatedByString:@"\n"];
    int x = 0;
    NSArray *datos[10];
    for (NSString *line in lines){
        datos[x] = @[[NSString stringWithFormat:@"%@", line]];
        NSLog(@"%@", [NSString stringWithFormat:@"line: %@", line]);
        x++;
    }
    
    self.nombre.text = [NSString stringWithFormat: @"%@", datos[0]];
    self.apellido.text =[NSString stringWithFormat: @"%@", datos[1]];
    self.direccion.text =[NSString stringWithFormat: @"%@", datos[2]];
    self.edad.text=[NSString stringWithFormat: @"%@", datos[3]];
    self.peso.text=[NSString stringWithFormat: @"%@", datos[4]];
    self.estatura.text=[NSString stringWithFormat: @"%@", datos[5]];
    self.padecimiento.text=[NSString stringWithFormat: @"%@", datos[6]];
    self.medicamento.text=[NSString stringWithFormat: @"%@", datos[7]];
    self.usuario.text=[NSString stringWithFormat: @"%@", datos[8]];
    self.contrasena.text=[NSString stringWithFormat: @"%@", datos[9]];
    
    self.nombre.text = [[self.nombre.text stringByReplacingOccurrencesOfString:@"(     " withString:@""] stringByReplacingOccurrencesOfString:@")" withString:@""];
    self.apellido.text = [[self.apellido.text stringByReplacingOccurrencesOfString:@"(     " withString:@""] stringByReplacingOccurrencesOfString:@")" withString:@""];
    self.direccion.text = [[self.direccion.text stringByReplacingOccurrencesOfString:@"(     " withString:@""] stringByReplacingOccurrencesOfString:@")" withString:@""];
    self.edad.text = [[self.edad.text stringByReplacingOccurrencesOfString:@"(     " withString:@""] stringByReplacingOccurrencesOfString:@")" withString:@""];
    self.peso.text = [[self.peso.text stringByReplacingOccurrencesOfString:@"(     " withString:@""] stringByReplacingOccurrencesOfString:@")" withString:@""];
    self.estatura.text = [[self.estatura.text stringByReplacingOccurrencesOfString:@"(     " withString:@""] stringByReplacingOccurrencesOfString:@")" withString:@""];
    self.padecimiento.text = [[self.padecimiento.text stringByReplacingOccurrencesOfString:@"(     " withString:@""] stringByReplacingOccurrencesOfString:@")" withString:@""];
    self.medicamento.text = [[self.medicamento.text stringByReplacingOccurrencesOfString:@"(     " withString:@""] stringByReplacingOccurrencesOfString:@")" withString:@""];
    self.usuario.text = [[self.usuario.text stringByReplacingOccurrencesOfString:@"(     " withString:@""] stringByReplacingOccurrencesOfString:@")" withString:@""];
    self.contrasena.text = [[self.contrasena.text stringByReplacingOccurrencesOfString:@"(     " withString:@""] stringByReplacingOccurrencesOfString:@")" withString:@""];
    
}

- (IBAction)cancelar:(id)sender {
    self.nombre.text = @"";
    self.apellido.text =@"";
    self.direccion.text =@"";
    self.edad.text=@"";
    self.peso.text=@"";
    self.estatura.text=@"";
    self.padecimiento.text=@"";
    self.medicamento.text=@"";
    self.usuario.text=@"";
    self.contrasena.text=@"";
    
}



- (IBAction)guardar:(id)sender {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"usuario.txt"];
    
    NSString *nombre = self.nombre.text;
    NSString *apellido = self.apellido.text;
    NSString *direccion = self.direccion.text;
    NSString *edad = self.edad.text;
    NSString *peso = self.peso.text;
    NSString *estatura = self.estatura.text;
    NSString *padecimiento = self.padecimiento.text;
    NSString *medicamento = self.medicamento.text;
    NSString *usuario = self.usuario.text;
    NSString *contrasena = self.contrasena.text;
    
    
    NSString *str = [NSString stringWithFormat: @"%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@", nombre, apellido,direccion,edad,peso,estatura,padecimiento,medicamento,usuario,contrasena];
    
    [str writeToFile:filePath atomically:TRUE encoding:NSUTF8StringEncoding error:NULL];
    [self alerta:@"Contacto Agregado" :@"" :0];
    
    }

- (void) alerta:(NSString *)msg :(NSString *)title :(int) tag
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:msg
                                                       delegate:self
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil, nil];
    alertView.tag = tag;
    [alertView show];
}

@end
