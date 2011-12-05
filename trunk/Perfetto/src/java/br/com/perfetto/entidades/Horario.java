/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.perfetto.entidades;

/**
 *
 * @author Ricardo
 */
public class Horario {
    private int id;
    private int periodo;
    private String horario;
    private String segunda;
    private String terca;
    private String quarta;
    private String quinta;
    private String sexta;
    private String sabado;

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * @return the periodo
     */
    public int getPeriodo() {
        return periodo;
    }

    /**
     * @param periodo the periodo to set
     */
    public void setPeriodo(int periodo) {
        this.periodo = periodo;
    }

    /**
     * @return the horario
     */
    public String getHorario() {
        return horario;
    }

    /**
     * @param horario the horario to set
     */
    public void setHorario(String horario) {
        this.horario = horario;
    }

    /**
     * @return the segunda
     */
    public String getSegunda() {
        return segunda;
    }

    /**
     * @param segunda the segunda to set
     */
    public void setSegunda(String segunda) {
        this.segunda = segunda;
    }

    /**
     * @return the terca
     */
    public String getTerca() {
        return terca;
    }

    /**
     * @param terca the terca to set
     */
    public void setTerca(String terca) {
        this.terca = terca;
    }

    /**
     * @return the quarta
     */
    public String getQuarta() {
        return quarta;
    }

    /**
     * @param quarta the quarta to set
     */
    public void setQuarta(String quarta) {
        this.quarta = quarta;
    }

    /**
     * @return the quinta
     */
    public String getQuinta() {
        return quinta;
    }

    /**
     * @param quinta the quinta to set
     */
    public void setQuinta(String quinta) {
        this.quinta = quinta;
    }

    /**
     * @return the sexta
     */
    public String getSexta() {
        return sexta;
    }

    /**
     * @param sexta the sexta to set
     */
    public void setSexta(String sexta) {
        this.sexta = sexta;
    }

    /**
     * @return the sabado
     */
    public String getSabado() {
        return sabado;
    }

    /**
     * @param sabado the sabado to set
     */
    public void setSabado(String sabado) {
        this.sabado = sabado;
    }
}
