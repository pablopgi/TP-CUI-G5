package com.example.pivanic.duelodeleyendas.model;

public enum Caracteristica {

    PoderDeHabilidad {
        @Override
        public String toString() {
            return "Poder de Habilidad";
        }
    }, PoderDeAtaque {
        @Override
        public String toString() {
            return "Poder de Ataque";
        }
    }, PoderDeDefensa {
        @Override
        public String toString() {
            return "Poder de Defensa";
        }
    }, ResistenciaMagica {
        @Override
        public String toString() {
            return "Resistencia Magica";
        }
    };

    public abstract String toString();
}