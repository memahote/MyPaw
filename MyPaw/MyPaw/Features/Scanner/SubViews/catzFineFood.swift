//
//  MeatzView.swift
//  MyPaw
//
//  Created by Lucie Grunenberger  on 12/11/2025.
//

import SwiftUI

struct catzFineFood: View {
    var body: some View {
            VStack{
                
                ZStack{
                    Image(.catzFinefood)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 402, height: 361)
                        .clipShape(
                            .rect(
                                topLeadingRadius: 0,
                                bottomLeadingRadius: 30,
                                bottomTrailingRadius: 30,
                                topTrailingRadius: 0
                            )
                        )
                        .ignoresSafeArea()
                    
                    
                    Rectangle()
                        .frame(width: 402, height: 361)
                        .foregroundStyle(Color.darkBrown.opacity(0.5))
                        .clipShape(
                            .rect(
                                topLeadingRadius: 0,
                                bottomLeadingRadius: 30,
                                bottomTrailingRadius: 30,
                                topTrailingRadius: 0
                            )
                        )
                        .ignoresSafeArea()
                    
                    VStack{
                        Spacer()
                        
                        Text("Friandises Catz")
                            .fontWeight(.bold)
                            .font(.system(size: 30))
                            .foregroundStyle(Color.whiteDirt)
                            .padding(20)
                    }
                    
                    
                }
                .frame(width: 400, height: 220)
                .ignoresSafeArea()
                
                VStack{
                ScrollView{

                
                VStack{
                    Spacer(minLength: 40)
                    ProgressBarCustom(total: 75)
                    HStack{
                        Spacer()
                        Text("75/100")
                            .padding(.horizontal, 50)
                            .foregroundStyle(Color.darkBrown)
                    }
                }
                
                HStack{
                    VStack{
                        HStack{
                            Rectangle()
                                .frame(width: 15, height: 15)
                                .cornerRadius(10)
                                .foregroundStyle(Color.orangeDeep)
                            Text("Gras")
                                .font(.custom("SF Pro", size: 16))
                                .bold()
                                .padding(.vertical, 10)
                            
                            Spacer()
                            
                        }
                        HStack{
                            Rectangle()
                                .frame(width: 15, height: 15)
                                .cornerRadius(10)
                                .foregroundStyle(Color.orangeMid)
                            Text("Sucre")
                                .font(.custom("SF Pro", size: 16))
                                .bold()
                                .padding(.vertical, 10)
                            Spacer()
                            
                        }
                        HStack{
                            Rectangle()
                                .frame(width: 15, height: 15)
                                .cornerRadius(10)
                                .foregroundStyle(Color.orangeMid)
                            Text("Protéines")
                                .font(.custom("SF Pro", size: 16))
                                .bold()
                                .padding(.vertical, 10)
                            
                            Spacer()
                            
                            
                        }
                        HStack{
                            Rectangle()
                                .frame(width: 15, height: 15)
                                .cornerRadius(10)
                                .foregroundStyle(Color.orangeMid)
                            Text("Fibres")
                                .font(.custom("SF Pro", size: 16))
                                .bold()
                                .padding(.vertical, 10)
                            
                            Spacer()
                            
                        }
                    }.padding(.leading, 50)
                    
                    VStack{
                        HStack{
                            Rectangle()
                                .frame(width: 15, height: 15)
                                .cornerRadius(10)
                                .foregroundStyle(Color.greenLight)
                            Text("Additifs")
                                .font(.custom("SF Pro", size: 16))
                                .bold()
                                .padding(.vertical, 10)
                            
                            Spacer()
                            
                        }
                        HStack{
                            Rectangle()
                                .frame(width: 15, height: 15)
                                .cornerRadius(10)
                                .foregroundStyle(Color.greenLight)
                            Text("Calories")
                                .font(.custom("SF Pro", size: 16))
                                .bold()
                                .padding(.vertical, 10)
                            Spacer()
                            
                        }
                        HStack{
                            Rectangle()
                                .frame(width: 15, height: 15)
                                .cornerRadius(10)
                                .foregroundStyle(Color.greenLight)
                            Text("Sel")
                                .font(.custom("SF Pro", size: 16))
                                .bold()
                                .padding(.vertical, 10)
                            
                            Spacer()
                            
                            
                        }
                        HStack{
                            Rectangle()
                                .frame(width: 15, height: 15)
                                .cornerRadius(10)
                                .foregroundStyle(Color.greenLight)
                            Text("Impact écologique")
                                .font(.custom("SF Pro", size: 16))
                                .bold()
                                .padding(.vertical, 10)
                            
                            Spacer()
                            
                        }
                    }
                }
                
                Spacer()
                
                    VStack{
                        HStack{
                            Text("Choisissez plutôt")
                                .padding(20)
                            
                            Spacer()
                        }
                        
                        ScrollView(.horizontal, showsIndicators: false){
                            
                            HStack{
                                ZStack{
                                    Image("imgScanner2")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 136, height: 177)
                                        .cornerRadius(20)
                                    
                                    Rectangle()
                                        .foregroundStyle(Color.darkBrown.opacity(0.5))
                                        .cornerRadius(20)
                                    
                                    VStack{
                                        Text("Fresh Kisses")
                                            .padding(.trailing, 50)
                                            .padding(.bottom, 10)
                                            .fontWeight(.bold)
                                            .font(.system(size: 20))
                                            .foregroundStyle(Color.white)
                                        
                                        Text("Pâtée humide pour chats et chatons")
                                            .font(.system(size: 12))
                                            .foregroundStyle(Color.white)
                                            .padding(.leading, 10)
                                        
                                        
                                    }                                    .frame(width: 136, height: 177)
                                    
                                    
                                    
                                }
                                
                                ZStack{
                                    Image("imgScanner1")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 136, height: 177)
                                        .cornerRadius(20)
                                    
                                    Rectangle()
                                        .foregroundStyle(Color.darkBrown.opacity(0.5))
                                        .cornerRadius(20)
                                    
                                    VStack{
                                        Text("Barchers")
                                            .padding(.trailing, 30)
                                            .padding(.leading, 5)
                                            .padding(.bottom, 10)
                                            .fontWeight(.bold)
                                            .font(.system(size: 20))
                                            .foregroundStyle(Color.white)
                                        
                                        Text("Friandises pour chats et chatons")
                                            .font(.system(size: 12))
                                            .foregroundStyle(Color.white)
                                            .padding(.leading, 10)
                                        
                                        
                                    }                                    .frame(width: 136, height: 177)
                                    
                                    
                                    
                                }
                                
                                ZStack{
                                    Image("imgScanner3")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 136, height: 177)
                                        .cornerRadius(20)
                                    
                                    Rectangle()
                                        .foregroundStyle(Color.darkBrown.opacity(0.5))
                                        .cornerRadius(20)
                                    
                                    VStack{
                                        Text("Crakers")
                                            .padding(.trailing, 30)
                                            .padding(.leading, 5)
                                            .padding(.bottom, 10)
                                            .fontWeight(.bold)
                                            .font(.system(size: 20))
                                            .foregroundStyle(Color.white)
                                        
                                        Text("gâteaux pour chats et chiens")
                                            .font(.system(size: 12))
                                            .foregroundStyle(Color.white)
                                            .padding(.leading, 10)
                                        
                                    }                                    .frame(width: 136, height: 177)
                                    
                                    
                                    
                                }
                                
                                
                            }
                        }.padding(.leading, 20)
                    }
                }
                
                }
           
        }
            .background(Color.whiteDirt)
    }
}

#Preview {
    catzFineFood()
}
