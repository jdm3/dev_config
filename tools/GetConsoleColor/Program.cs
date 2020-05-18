using System;

namespace GetConsoleColor
{
    class Program
    {
        enum Color
        {
            None,
            Foreground,
            Background,
        }

        static bool ParsePrefix(string arg, out int i)
        {
            i = 0;
            if (arg.Length == 0) return false;
            if (arg[i] == '/') ++i;
            else {
                if (arg[i] != '-') return false;
                if (++i < arg.Length && arg[i] == '-') ++i;
            }
            return true;
        }

        static bool Match(string arg, int i, string s)
        {
            return string.Compare(arg, i, s, 0, s.Length, true) == 0;
        }

        static void Usage(string error)
        {
            if (error != null) {
                Console.Error.WriteLine(error);
            }

            Console.WriteLine("usage: GetConsoleColor (options)");
            Console.WriteLine("options:");
            Console.WriteLine("    /Foreground   Return the foreground color");
            Console.WriteLine("    /Background   Return the background color");
            Environment.Exit(-1);
        }

        static void SetColor(ref Color color, Color value)
        {
            if (color != Color.None) {
                Usage($"error: only one color option can be specified");
            }
            color = value;
        }

        static void Main(string[] args)
        {
            var color = Color.None;
            foreach (var arg in args) {
                if (ParsePrefix(arg, out var i)) {
                    if (Match(arg, i, "foreground")) { SetColor(ref color, Color.Foreground); continue; }
                    if (Match(arg, i, "background")) { SetColor(ref color, Color.Background); continue; }
                    if (Match(arg, i, "help") || Match(arg, i, "h") || Match(arg, i, "?")) {
                        Usage(null);
                    }
                }
                Usage($"error: unknown command line argument: {arg}");
            }

            if (color == Color.None) {
                Usage($"error: color option not specified");
            }

            Environment.Exit(color == Color.Foreground
                ? (int) Console.ForegroundColor
                : (int) Console.BackgroundColor);
        }
    }
}
