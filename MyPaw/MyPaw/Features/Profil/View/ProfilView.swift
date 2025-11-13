//
//  ProfilView.swift
//  MyPaw
//
//  Created by Lucie Grunenberger  on 13/11/2025.
//

import SwiftUI

struct ProfilView: View {
    @State var animalProfil = AnimalProfile()
    var body: some View {
        
        VStack{
            Image(.sam)
                .resizable()
                .scaledToFill()
                .clipShape(
                    .rect(
                        topLeadingRadius: 0,
                        bottomLeadingRadius: 30,
                        bottomTrailingRadius: 30,
                        topTrailingRadius: 0
                    )
                )
                .frame(width: .infinity, height: 331)
                .ignoresSafeArea()

                        
            Text("Sam")
                .fontWeight(.bold)
                .font(.system(size: 30))
                .foregroundStyle(Color.orangeDeep)
                .padding(.top, 40)
            
            HStack(alignment: .top){
                VStack{
                    ZStack{
                        Rectangle()
                            .frame(width: 67, height: 67)
                            .cornerRadius(100)
                            .foregroundStyle(Color.orangeDeep)
                        
                        Text("1")
                            .fontWeight(.bold)
                            .font(.system(size: 20))
                            .foregroundStyle(Color.whiteDirt)

                        
                    }
                    
                    Text("An")
                        .fontWeight(.bold)
                        .font(.system(size: 16))
                        .foregroundStyle(Color.darkBrown)

                        
                }
                Spacer()
                VStack{
                    ZStack{
                        Rectangle()
                            .frame(width: 67, height: 67)
                            .cornerRadius(100)
                            .foregroundStyle(Color.orangeDeep)
                        
                        Text("1,4")
                            .fontWeight(.bold)
                            .font(.system(size: 20))
                            .foregroundStyle(Color.whiteDirt)

                        
                    }
                    
                    Text("Kilos")
                        .fontWeight(.bold)
                        .font(.system(size: 16))
                        .foregroundStyle(Color.darkBrown)

                        
                }
                Spacer()
                VStack{
                    ZStack{
                        Rectangle()
                            .frame(width: 67, height: 67)
                            .cornerRadius(100)
                            .foregroundStyle(Color.orangeDeep)
                        
                        Text("221")
                            .fontWeight(.bold)
                            .font(.system(size: 20))
                            .foregroundStyle(Color.whiteDirt)

                        
                    }
                    
                    Text("Jours sur \n MyPaw")
                        .fontWeight(.bold)
                        .font(.system(size: 16))
                        .foregroundStyle(Color.darkBrown)

                        
                }

            }.padding(.horizontal, 40)
                .padding(.vertical, 10)
            
            Spacer()
            
            VStack{
                HStack{
                    Text("Mon carnet de santé")
                        .fontWeight(.bold)
                        .font(.system(size: 16))
                        .foregroundStyle(Color.darkBrown)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                        .foregroundStyle(Color.orangeDeep)

                }.padding(.horizontal, 40)
                
                Divider()
                
                HStack{
                    Text("Mes ordonances")
                        .fontWeight(.bold)
                        .font(.system(size: 16))
                        .foregroundStyle(Color.darkBrown)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                        .foregroundStyle(Color.orangeDeep)

                }.padding(.horizontal, 40)
                
                Divider()

                
                HStack{
                    Text("Mon compte")
                        .fontWeight(.bold)
                        .font(.system(size: 16))
                        .foregroundStyle(Color.darkBrown)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                        .foregroundStyle(Color.orangeDeep)

                }.padding(.horizontal, 40)
                
                Divider()

            }
            
//            Spacer(minLength: 60)
            
        }.background(Color.whiteDirt)
        
    }
}

#Preview {
    ProfilView()
}
