using System;
using System.Collections.Generic;
using System.Text;
using System.Text.RegularExpressions;

namespace ror_data
{
    public class Helper
    {
        public string Capitalise(string s)
        {
            string capped_s = "", new_s = "";

            if (s.Length < 4)
            {
                capped_s = s.ToUpper();
            }
            else if (s.Contains(" "))
            {
                string[] words = s.Split(" ");
                foreach (string w in words)
                {
                    new_s += " " + w[0].ToString().ToUpper() + w.Substring(1);
                }
                capped_s = new_s.Substring(1);
            }
            else if (s.Contains("-"))
            {
                string[] words = s.Split("-");
                foreach (string w in words)
                {
                    new_s += "-" + w[0].ToString().ToUpper() + w.Substring(1);
                }
                capped_s = new_s.Substring(1);
            }
            else
            {
                capped_s = s[0].ToString().ToUpper() + s.Substring(1);
            }

            capped_s = capped_s.Replace(" Of ", " of ");
            capped_s = capped_s.Replace(" And ", " and ");
            capped_s = capped_s.Replace(" The ", " the ");

            return capped_s;
        }


        public string Clean(string s)
        {
            {
                string return_value = "";

                if (s != null)
                {
                    string s1 = s.Trim();

                    // remove any periods, bullet polints
                    s1 = s1.Replace(".", "");
                    s1 = s1.Replace("•", "");

                    // remove non visible characters
                    s1 = Regex.Replace(s1, @"[\u200B]+", string.Empty); // zero width space
                    s1 = Regex.Replace(s1, @"[\u200D]+", string.Empty); // zero width joiner
                    s1 = Regex.Replace(s1, @"[\u200E]+", string.Empty); // embedded LTR code
                    s1 = Regex.Replace(s1, @"[\u202B]+", string.Empty); // embedded RTL code
                    s1 = Regex.Replace(s1, @"[\uFEFF]+", string.Empty); // zero width no break space

                    // replace directed double quotes and guillemets with single quotes
                    string s2 = s1.Replace("“", "‘").Replace("”", "’");
                    s2 = s2.Replace("«", "‘").Replace("»", "’");
                    // double stright quotes into singles
                    s2 = s2.Replace("''", "'");
                    // straight double quotes turned into apostrophes
                    s2 = s2.Replace("\"", "'");

                    string s3 = s2.Trim();

                    // turn apostrophes into appropriate single quotes
                    while (s3.Contains("'"))
                    {
                        int apos_pos = s3.IndexOf("'");
                        int alen = s3.Length;
                        if (apos_pos == 0)
                        {
                            // make it a left quote unless there is no other apostrophe in the string
                            s3 = s3.Substring(1, s3.Length - 1).Contains("'") ? "‘" + s3.Substring(1) : "’" + s3.Substring(1);
                        }
                        else if (apos_pos == alen - 1)
                        {
                            s3 = s3.Substring(0, alen - 1) + "’";
                        }
                        else
                        {
                            if (s3[apos_pos - 1] == ' ' || s3[apos_pos - 1] == '(')
                            {
                                s3 = s3.Substring(0, apos_pos) + "‘" + s3.Substring(apos_pos + 1, alen - apos_pos - 1);

                            }
                            else
                            {
                                s3 = s3.Substring(0, apos_pos) + "’" + s3.Substring(apos_pos + 1, alen - apos_pos - 1);
                            }
                        }
                    }

                    // if name has only opening and closing quotes get rid of them both
                    if (s3.StartsWith("‘") && s3.EndsWith("’"))
                    {
                        // assuming no other end quote, which makes the interpretation more tricky
                        if (!s3.Substring(0, s3.Length - 1).Contains("’"))
                        {
                            s3 = s3.Substring(1, s3.Length - 2);
                        }
                    }

                    return_value = s3;
                }

                return return_value;
            }
        }
    }
}
