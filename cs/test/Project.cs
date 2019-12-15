

namespace project {
  // windows.form
  public partial class Project : Form {
    private readonly List<Item> AnalyzSource = new List<Item>();

    public project() {
      InitializeComponent();
      Initialize2();
      InitializeDataGridView();
    }

    private void Initialize2() {
      // init
    }
  }
}