package launch;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JTextField;

class CalculatorView extends JFrame{
    
    private JLabel additionLabel1;
    
    public CalculatorView() {
        super();
        configurarVentana();
        inicializarComponentes();
    }

    private void configurarVentana() {
        this.setTitle("Ventana");
        this.setSize(200, 150);
        this.setLocationRelativeTo(null);
        this.setLayout(null);
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    }
    
    private void inicializarComponentes() {
        additionLabel1 = new JLabel();
        additionLabel1.setText("Servidor Corriendo");
        additionLabel1.setBounds(25, 25, 150, 25);
        
        this.add(additionLabel1);
    }
}
